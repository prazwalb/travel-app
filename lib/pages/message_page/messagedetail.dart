import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/conversation_controller.dart';
import 'package:flutter_project/models/conversation.dart';
import 'package:flutter_project/models/messagecontent.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MessageDetails extends StatefulWidget {
  final Conversation conversation;

  const MessageDetails({super.key, required this.conversation});

  @override
  State<MessageDetails> createState() => _MessageDetailsState();
}

class _MessageDetailsState extends State<MessageDetails> {
  final TextEditingController textcontroller = TextEditingController();

  Widget _buildMessage(int index) {
    final messageContent = widget.conversation.messages[index];
    // if (messageContent.user == conversation.messages.se) {
    return SentMessageWidget(content: messageContent);
    // }
    // return RecievedMessageWidget(receivedContent: messageContent);
  }

  void messageSent() {
    context.read<ConversationController>().sendmessage(
          MessageContent(
            message: textcontroller.text,
            sentAt: DateTime.now(),
            userProfileImageUrl: 'userProfileImageUrl',
            userName: widget.conversation.userName,
            lastSentAt: DateTime.now(),
          ),
        );
    textcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp)),
        title: Column(
          children: [
            Text(
              widget.conversation.userName,
            ),
            const Text(
              'Active Now',
              style: TextStyle(color: Colors.green, fontSize: 14),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Divider(),
            // Spacer(),
            for (int i = 0; i < widget.conversation.messages.length; i++)
              _buildMessage(i),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.attach_file),
                      hintText: 'Type your message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: textcontroller,
                    onFieldSubmitted: (value) {
                      messageSent();
                    },
                  ),
                ),
                IconButton(
                    onPressed: () {
                      messageSent();
                    },
                    icon: const Icon(Icons.send))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SentMessageWidget extends StatelessWidget {
  final MessageContent content;

  const SentMessageWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
          color: Colors.lightBlue.shade100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(content.message),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(DateFormat.jm().format(content.sentAt)),
                const Icon(Icons.check)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RecievedMessageWidget extends StatelessWidget {
  final MessageContent receivedContent;
  const RecievedMessageWidget({
    super.key,
    required this.receivedContent,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(receivedContent.userProfileImageUrl),
          ),
          Container(
            width: 300,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              color: Color.fromARGB(255, 242, 246, 247),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  receivedContent.message,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(DateFormat.jm().format(receivedContent.lastSentAt)),
                    const Icon(Icons.check)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
