import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/destination_controller.dart';
import 'package:flutter_project/data.dart';
import 'package:flutter_project/networking.dart';
import 'package:flutter_project/widget/bestDestination.dart';

import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  static Future<List<Bestdestination>> getDestination() async {
    final res = await http
        .get(Uri.parse('http://192.168.1.101:8080/popular-destinations'));
    final datadecode = jsonDecode(res.body);
    List<Bestdestination> data = [];
    for (var i = 0; i < datadecode.length; i++) {
      data.add(Bestdestination.fromJson(datadecode[i]));
    }
    return data;
  }

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    context.read<DestinationController>().getDestination();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                    'https://images.pexels.com/photos/8159657/pexels-photo-8159657.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    height: 40,
                    width: 40,
                    fit: BoxFit.contain),
              ),
              Text(
                'John Doe',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notification_add, size: 35))
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 4, 4, 4),
                    fontSize: 40),
                children: [
                  TextSpan(text: 'Explore the \nBeautiful'),
                  TextSpan(
                      text: ' world!',
                      style: TextStyle(color: Colors.deepOrange))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Best Destination',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Text('View all',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 4, 94, 249),
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
                height: 600,
                child: Consumer<DestinationController>(
                  builder: (context, value, child) {
                    return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return DestinationCards(
                              destination: value.destination![index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: value.destination!.length);
                  },
                  // child: FutureBuilder(
                  //   future: getDestination(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.done) {
                  //       return ListView.separated(
                  //           scrollDirection: Axis.horizontal,
                  //           itemBuilder: (context, index) {
                  //             return DestinationCards(
                  //                 destination: snapshot.data![index]);
                  //           },
                  //           separatorBuilder: (context, index) {
                  //             return SizedBox(
                  //               height: 20,
                  //             );
                  //           },
                  //           itemCount: snapshot.data!.length);
                  //     }
                  //     return Text('No data');
                  //   },
                  // ),
                )
                // ListView.separated(
                //   itemBuilder: (context, index) =>
                // DestinationCards(destination: destinations[index]),
                //   scrollDirection: Axis.horizontal,
                //   separatorBuilder: (context, index) => SizedBox(
                //     width: 10,
                //   ),
                //   itemCount: destinations.length,
                // ),
                )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blueAccent),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
            backgroundColor: Colors.blueGrey,
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
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

class DestinationCards extends StatelessWidget {
  final Bestdestination destination;

  const DestinationCards({super.key, required this.destination});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 400,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Container
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: GestureDetector(
                          onTap: ()
                              // {
                              //   context.goNamed('photos');
                              // },
                              {
                            context.goNamed('detailspage', pathParameters: {
                              'destinationId': destination.id,
                            });
                          },
                          child: Image.network(
                            destination.imageUrl,
                            height: 300,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Bookmark Icon
                      Positioned(
                        top: 8,
                        right: 8,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.bookmark_border,
                              color: const Color.fromARGB(255, 14, 14, 14),
                              size: 24,
                            )),
                      ),
                      Positioned(
                          top: 14,
                          right: 8,
                          child: TextButton(
                              onPressed: () {
                                context
                                    .read<DestinationController>()
                                    .deleteDestination(destination.id);
                              },
                              child: Text("DELETE")))
                    ],
                  ),

                  // Text Content
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          destination.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(destination.rating.toStringAsFixed(1)),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Text(
                        destination.location,
                        style: TextStyle(fontSize: 20, color: Colors.grey[800]),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
