import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              context.goNamed('notificationpage');
            },
            child: Text(
              'Done',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/27063771/pexels-photo-27063771/free-photo-of-woman-dressed-in-black-suit-shuffling-deck-of-cards.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Username',
                  style: TextStyle(fontSize: 28),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change Profile Picture',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Text(
                'First Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    suffixIcon: Icon(
                      Icons.check,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Text(
                'Last Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    suffixIcon: Icon(
                      Icons.check,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Text(
                'Location',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    suffixIcon: Icon(
                      Icons.check,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Text(
                'Mobile Number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    suffixIcon: Icon(
                      Icons.check,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
