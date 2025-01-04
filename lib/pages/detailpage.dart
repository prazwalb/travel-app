import 'package:flutter/material.dart';
import 'package:flutter_project/data.dart';
import 'package:go_router/go_router.dart';

// import 'package:go_router/go_router.dart';

class DestinationDetailsPage extends StatefulWidget {
  final String destinationId;

  const DestinationDetailsPage({super.key, required this.destinationId});

  @override
  State<DestinationDetailsPage> createState() => _DestinationDetailsPageState();
}

class _DestinationDetailsPageState extends State<DestinationDetailsPage> {
  final images = [
    'https://images.pexels.com/photos/29768361/pexels-photo-29768361/free-photo-of-stylish-woman-in-urban-setting-with-motion-blur.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/26570991/pexels-photo-26570991/free-photo-of-xmas-cards-in-niche.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/29990907/pexels-photo-29990907/free-photo-of-artisan-bread-and-olives-with-appetizers.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/14563895/pexels-photo-14563895.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/29694769/pexels-photo-29694769/free-photo-of-cute-christmas-gnomes-by-the-fireplace.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
  ];
  @override
  Widget build(BuildContext context) {
    final destination = destinations
        .firstWhere((element) => element.id == widget.destinationId);
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Image.network(
                destination.image,
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
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
                          context.goNamed('homepage');
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      Text(
                        'Details',
                        style: TextStyle(fontSize: 25),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.bookmark_border),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Card(
            color: Colors.grey.shade200,
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            destination.name,
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            destination.location,
                            style: TextStyle(
                                fontSize: 20,
                                color:
                                    const Color.fromARGB(255, 105, 105, 105)),
                          ),
                        )
                      ],
                    ),
                    Image.network(
                      destination.image,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text(destination.name)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amberAccent,
                        ),
                        Text(destination.rating.toStringAsFixed(2))
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${destination.pricePerperson}/',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        Text('Person')
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                            height: 60,
                            width: 60,
                          ));
                    },
                  ),
                )
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     spacing: 20,
                //     children: [
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: Image.network(
                //           'https://images.pexels.com/photos/29851701/pexels-photo-29851701/free-photo-of-elegant-dessert-display-with-sparkling-touch.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                //           height: 60,
                //           width: 60,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: Image.network(
                //           'https://images.pexels.com/photos/26570991/pexels-photo-26570991/free-photo-of-xmas-cards-in-niche.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                //           height: 60,
                //           width: 60,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: Image.network(
                //           'https://images.pexels.com/photos/29694769/pexels-photo-29694769/free-photo-of-cute-christmas-gnomes-by-the-fireplace.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                //           height: 60,
                //           width: 60,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: Image.network(
                //           'https://images.pexels.com/photos/29768361/pexels-photo-29768361/free-photo-of-stylish-woman-in-urban-setting-with-motion-blur.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                //           height: 60,
                //           width: 60,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: Image.network(
                //           'https://images.pexels.com/photos/29784452/pexels-photo-29784452/free-photo-of-black-and-white-palm-trees-at-pismo-beach.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                //           height: 60,
                //           width: 60,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: Image.network(
                //           'https://images.pexels.com/photos/29054656/pexels-photo-29054656/free-photo-of-dynamic-motion-of-berlin-tram-at-sunset.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                //           height: 60,
                //           width: 60,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: Image.network(
                //           'https://images.pexels.com/photos/28594392/pexels-photo-28594392/free-photo-of-artistic-flat-lay-of-coffee-essentials-on-dark-surface.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                //           height: 60,
                //           width: 60,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: Image.network(
                //           'https://images.pexels.com/photos/29076255/pexels-photo-29076255/free-photo-of-vibrant-indoor-market-scene-with-stalls.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                //           height: 60,
                //           width: 60,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: Image.network(
                //           'https://images.pexels.com/photos/29487999/pexels-photo-29487999/free-photo-of-seagulls-flying-over-istanbul-skyline.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                //           height: 60,
                //           width: 60,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                ,
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'About Destination',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(destination.description),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      context.goNamed('viewpage', pathParameters: {
                        'destinationId': widget.destinationId
                      });

                      // context.goNamed('schedule');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Book Now',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
