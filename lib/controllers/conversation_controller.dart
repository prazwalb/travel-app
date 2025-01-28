import 'package:flutter/material.dart';
import 'package:flutter_project/pages/messagepage/messagedetail.dart';
import 'package:flutter_project/widget/message_card.dart';

class ConversationController extends ChangeNotifier {
  List<Conversation> conversations = [
    Conversation(
        profileImage:
            'https://images.pexels.com/photos/1371360/pexels-photo-1371360.jpeg?auto=compress&cs=tinysrgb&w=400',
        userName: 'Prajwal Bastola',
        isSeen: false,
        messages: [

      ]
    ),
  ];

  void addConversation(String name) {
    conversations.add(
      Conversation(
        userName: name,
        profileImage:
            'https://images.pexels.com/photos/30319457/pexels-photo-30319457/free-photo-of-close-up-portrait-of-a-domestic-cat.jpeg',
        messages: [],
      ),
    );
    notifyListeners();
  }

  void sendmessage(MessageContent message) {
    final toSendConversation =
        conversations.firstWhere((c) => c.userName == message.userName);
    toSendConversation.messages.add(message);
    notifyListeners();

    // for (var c in conversations) {
    //   if (c.userName == username) {
    //     c.messages.add(message);
    //     notifyListeners();
    //   }
    // }
  }

  //TODO: FEATURE: SEND MESSGE
  // SELECT A CONVERSATION AND NAVIGATE TO MESSAGE DETAILS PAGE
  // GET TEXT CONTENT FROM TEXTFIELD IN MESSSAGE DETAIL SCREEN
  // WHEN PRESSED ENTER OR CLICK SEND BUTTON -> ADD MESSGE TO message list property on conversation
}
