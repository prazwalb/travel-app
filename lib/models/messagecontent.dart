import 'package:json_annotation/json_annotation.dart';
part 'messagecontent.g.dart';

@JsonSerializable()
class MessageContent {
  final String message;
  final DateTime sentAt;
  final String userProfileImageUrl;
  final bool isSeen;
  final String userName;
  final DateTime lastSentAt;

  MessageContent({
    required this.message,
    required this.sentAt,
    required this.userProfileImageUrl,
    this.isSeen = false,
    required this.userName,
    required this.lastSentAt,
  });

  factory MessageContent.fromJson(Map<String, dynamic> json) =>
      _$MessageContentFromJson(json);
  Map<String, dynamic> toJson() => _$MessageContentToJson(this);
}
