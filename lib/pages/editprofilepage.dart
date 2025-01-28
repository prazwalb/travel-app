import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Editprofile extends StatelessWidget {
  const Editprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
        title: const Text("Edit Profile"),
        actions: [TextButton(onPressed: () {}, child: const Text("Done"))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/1040881/pexels-photo-1040881.jpeg?auto=compress&cs=tinysrgb&w=600'),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'txt',
                textScaler: TextScaler.linear(1.5),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Change Profile Picture',
                  selectionColor: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('First Name'),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            )
          ],
        ),
      ),
    );
  }
}
