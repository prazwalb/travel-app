import 'package:flutter/material.dart';
import 'package:flutter_project/pages/messagepage/messagedetail.dart';
import 'package:go_router/go_router.dart';

enum UserStatus {
  active,
  offline,
  busy,
  donotdisturbe,
}

class MessageCard extends StatelessWidget {
  final Conversation conversation;
  final UserStatus status;

  const MessageCard({
    super.key,
    required this.conversation,
    this.status = UserStatus.active,
  });

  Color getColorBasedOnStatus() {
    switch (status) {
      case UserStatus.active:
        return Colors.green;
      case UserStatus.offline:
        return Colors.grey;
      case UserStatus.busy:
        return Colors.yellow;
      case UserStatus.donotdisturbe:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.goNamed(
          'message-details',
          pathParameters: {
            'username': conversation.userName,
          },
        );
      },
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(conversation.profileImage),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(7),
                color: getColorBasedOnStatus(),
              ),
              height: 14,
              width: 14,
            ),
          )
        ],
      ),
      title: Text(conversation.userName),
      subtitle: conversation.isTyping
          ? const Text(
              'Typing...',
              style: TextStyle(color: Colors.blue),
            )
          : Text(conversation.messages.isNotEmpty
              ? conversation.messages.last.message
              : '-'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // message.isSeen ? Icon(Icons.check) : SizedBox(),
          Visibility(
            visible: conversation.isSeen,
            child: const Icon(Icons.check),
          ),
          // Text(
          //   DateFormat.jm().format(conversation.lastSentAt),
          // ),
        ],
      ),
    );
  }
}

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
}
