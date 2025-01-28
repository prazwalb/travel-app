import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/conversation_controller.dart';
import 'package:flutter_project/widget/message_card.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MessageHome extends StatelessWidget {
  const MessageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp)),
        title: const Text('Messages'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Messages",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit_square))
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search for chats & messages '),
            ),
            Consumer<ConversationController>(
              builder: (context, value, child) {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MessageCard(
                        conversation: value.conversations[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: value.conversations.length);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: ['pradip', 'prajwal']
                    .map(
                      (user) => ListTile(
                        onTap: () {
                          context
                              .read<ConversationController>()
                              .addConversation(user);
                          context.pop();
                        },
                        title: Text(user),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
