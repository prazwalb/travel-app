import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/destination_controller.dart';
import 'package:flutter_project/data.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Viewpage extends StatelessWidget {
  final String viewId;
  const Viewpage({super.key, required this.viewId});

  @override
  Widget build(BuildContext context) {
    final view = context
        .watch<DestinationController>()
        .destination
        .firstWhere((element) => element.id == viewId);
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () => context.pop(),
      //       icon: Icon(Icons.arrow_back_ios_new)),
      //   title: Text('View '),
      //   centerTitle: true,
      //   toolbarOpacity: 1.0,
      //   backgroundColor: ,

      // ),
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    view.imageUrl,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 30,
                    left: 0, // Added to ensure it starts from the left
                    right: 0, // Added to ensure it extends to the right
                    child: SizedBox(
                      width: MediaQuery.of(context)
                          .size
                          .width, // Set container width to screen width
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: Icon(Icons.arrow_back_ios),
                          ),
                          Text(
                            'View',
                            style: TextStyle(fontSize: 30),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 220, // Added to ensure it starts from the left
                    right: 10, // Added to ensure it extends to the right
                    child: Card(
                      color: const Color.fromARGB(255, 89, 90, 90),
                      elevation: 0,
                      child: SizedBox(
                        height: 100,
                        width: 200,
                        child: Row(
                          spacing: 25,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  'https://images.pexels.com/photos/3293148/pexels-photo-3293148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                  height: 100,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              spacing: 10,
                              children: [
                                SizedBox(height: 6),
                                Text(
                                  'La-Hotel',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  '2.09 mi',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 350,
                    left: 10, // Added to ensure it starts from the left
                    right: 200, // Added to ensure it extends to the right
                    child: Card(
                      color: const Color.fromARGB(255, 89, 90, 90),
                      elevation: 0,
                      child: SizedBox(
                        height: 100,
                        width: 200,
                        child: Row(
                          spacing: 25,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  'https://images.pexels.com/photos/2090651/pexels-photo-2090651.jpeg?auto=compress&cs=tinysrgb&w=600',
                                  height: 100,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              spacing: 10,
                              children: [
                                SizedBox(height: 6),
                                Text(
                                  'paris the grand',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  '2.08 mi',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10, // Added to ensure it starts from the left
                    right: 10,
                    bottom: 30, // Added to ensure it extends to the right
                    child: Card(
                      color: const Color.fromARGB(255, 89, 90, 90),
                      elevation: 0,
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${view.name}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                        '4.7',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.grey.shade400,
                                  ),
                                  Text(
                                    '${view.location}',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time_rounded,
                                    color: Colors.grey.shade400,
                                  ),
                                  Text(
                                    '45 Minutes',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ElevatedButton(
                                    onPressed: () {
                                      context.goNamed('schedulepage',
                                          pathParameters: {
                                            'destinationId': view.id,
                                            'viewId': view.id,
                                          });
                                    },
                                    child: Text('See on the Map'))),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
