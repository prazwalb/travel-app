import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_sharp)),
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                context.goNamed('editprofile');
              },
              icon: const Icon(Icons.edit_outlined))
        ],
      ),
      body: Column(
        children: [
          const Center(
            child: CircleAvatar(
              radius: 70,
              foregroundImage: NetworkImage(
                  'https://images.pexels.com/photos/287240/pexels-photo-287240.jpeg?auto=compress&cs=tinysrgb&w=600'),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Username',
            textScaler: TextScaler.linear(2),
          ),
          const Text(
            'user@gmail.com',
            style: TextStyle(fontWeight: FontWeight.w100),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text('Reward Points'),
                  Text(
                    1235.toString(),
                    style: TextStyle(color: Colors.blue[300]),
                  )
                ],
              ),
              Column(
                children: [
                  const Text('Travel Tips'),
                  Text(1235.toString(),
                      style: TextStyle(color: Colors.blue[300]))
                ],
              ),
              Column(
                children: [
                  const Text('Bucket List'),
                  Text(1235.toString(),
                      style: TextStyle(color: Colors.blue[300]))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Profile'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
                ListTile(
                    leading: const Icon(Icons.bookmark_border),
                    title: const Text('Bookmarked'),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios_outlined))),
                ListTile(
                    leading: const Icon(Icons.travel_explore),
                    title: const Text('Previous Trips'),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios_outlined))),
                ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Setting'),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios_outlined))),
                ListTile(
                    leading: const Icon(Icons.receipt_long_outlined),
                    title: const Text('Version'),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios_outlined))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
