import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios_new_sharp)),
        title: Text('Notification'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Clear all',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: () {}, child: Text('Recent')),
                TextButton(onPressed: () {}, child: Text('Earlier')),
                TextButton(onPressed: () {}, child: Text('Archieved'))
              ],
            ),
          ),
          Divider(),
          SingleChildScrollView(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('url'),
                  ),
                  title: Text('Super Offer'),
                  subtitle: Text('Offer is valid for 2 days'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
