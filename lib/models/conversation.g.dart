// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      profileImage: json['profileImage'] as String,
      userName: json['userName'] as String,
      isSeen: json['isSeen'] as bool? ?? false,
      isTyping: json['isTyping'] as bool? ?? false,
      isRead: json['isRead'] as bool? ?? false,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'profileImage': instance.profileImage,
      'userName': instance.userName,
      'isSeen': instance.isSeen,
      'isTyping': instance.isTyping,
      'isRead': instance.isRead,
      'messages': instance.messages,
    };
