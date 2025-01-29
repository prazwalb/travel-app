// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messagecontent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageContentImpl _$$MessageContentImplFromJson(Map<String, dynamic> json) =>
    _$MessageContentImpl(
      message: json['message'] as String,
      sentAt: DateTime.parse(json['sentAt'] as String),
      userProfileImageUrl: json['userProfileImageUrl'] as String,
      isSeen: json['isSeen'] as bool? ?? false,
      userName: json['userName'] as String,
      lastSentAt: DateTime.parse(json['lastSentAt'] as String),
    );

Map<String, dynamic> _$$MessageContentImplToJson(
        _$MessageContentImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'sentAt': instance.sentAt.toIso8601String(),
      'userProfileImageUrl': instance.userProfileImageUrl,
      'isSeen': instance.isSeen,
      'userName': instance.userName,
      'lastSentAt': instance.lastSentAt.toIso8601String(),
    };
