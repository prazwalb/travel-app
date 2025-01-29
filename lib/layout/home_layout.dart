import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeLayout extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const HomeLayout({super.key, required this.navigationShell});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

void colorchange() {}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: false,
      //   title: TextButton(
      //     onPressed: () {},
      //     child: Row(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         ClipRRect(
      //           borderRadius: BorderRadius.circular(20),
      //           child: Image.network(
      //               'https://images.pexels.com/photos/8159657/pexels-photo-8159657.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      //               height: 40,
      //               width: 40,
      //               fit: BoxFit.contain),
      //         ),
      //         const Text(
      //           'John Doe',
      //           style: TextStyle(fontSize: 20, color: Colors.black),
      //         ),
      //       ],
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () {},
      //         icon: const Icon(Icons.notification_add, size: 35))
      //   ],
      //   elevation: 0,
      // ),
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        showUnselectedLabels: true,
        onTap: (value) {
          widget.navigationShell.goBranch(value);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
