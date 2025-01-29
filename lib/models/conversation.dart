import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_project/models/messagecontent.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation.g.dart';

@JsonSerializable()
class Conversation {
  final String profileImage;
  final String userName;
  final bool isSeen;
  final bool isTyping;
  final bool isRead;
  List<MessageContent> messages;

  Conversation({
    required this.profileImage,
    required this.userName,
    this.isSeen = false,
    this.isTyping = false,
    this.isRead = false,
    required this.messages,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationToJson(this);
}
