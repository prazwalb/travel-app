import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'messagecontent.freezed.dart';
part 'messagecontent.g.dart';

@Freezed()
class MessageContent with _$MessageContent {
  const factory MessageContent({
    required String message,
    required DateTime sentAt,
    required String userProfileImageUrl,
    @Default(false) bool isSeen,
    required String userName,
    required DateTime lastSentAt,
  }) = _MessageContent;

  factory MessageContent.fromJson(Map<String, dynamic> json) =>
      _$MessageContentFromJson(json);
}
