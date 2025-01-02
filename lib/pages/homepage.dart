import 'package:flutter/material.dart';

// Data Model for Destinations
class Destination {
  final String imageUrl;
  final String title;
  final String location;
  final double rating;
  bool isFavorite;

  Destination({
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.rating,
    this.isFavorite = false,
  });
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  final List<Destination> _destinations = [
    Destination(
      imageUrl: 'https://picsum.photos/400/300?random=1',
      title: 'Niladri Reservoir',
      location: 'Tekergat, Sunamgnj',
      rating: 4.7,
    ),
    Destination(
      imageUrl: 'https://picsum.photos/400/300?random=2',
      title: 'Darma Reservoir',
      location: 'Darma, Indonesia',
      rating: 4.8,
    ),
    Destination(
      imageUrl: 'https://picsum.photos/400/300?random=3',
      title: 'Lake Louise',
      location: 'Alberta, Canada',
      rating: 4.9,
    ),
    Destination(
      imageUrl: 'https://picsum.photos/400/300?random=4',
      title: 'Moraine Lake',
      location: 'Banff, Canada',
      rating: 4.6,
    ),
  ];

  void _toggleFavorite(int index) {
    setState(() {
      _destinations[index].isFavorite = !_destinations[index].isFavorite;
    });
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF6F6),
      body: SafeArea(
        child: Column(
          children: [
            // Top Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile and Notification Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blue,
                            child: ClipOval(
                              child: Image.network(
                                'https://picsum.photos/100/100',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.person,
                                      color: Colors.white);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.notifications_none),
                            onPressed: () {},
                          ),
                          Positioned(
                            right: 12,
                            top: 12,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Title Section
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(text: 'Explore the\n'),
                        TextSpan(text: 'Beautiful '),
                        TextSpan(
                          text: 'world!',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Best Destination Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Best Destination',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('View all'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Scrollable Destination List
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _destinations.length,
                itemBuilder: (context, index) {
                  final destination = _destinations[index];
                  return _buildDestinationCard(
                    destination: destination,
                    onFavoritePressed: () => _toggleFavorite(index),
                  );
                },
              ),
            ),

            // Bottom Navigation Bar
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, 0),
                  _buildNavItem(Icons.calendar_today, 1),
                  _buildNavItem(Icons.search, 2),
                  _buildNavItem(Icons.message, 3),
                  _buildNavItem(Icons.person, 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDestinationCard({
    required Destination destination,
    required VoidCallback onFavoritePressed,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Favorite Button
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  destination.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image, size: 50),
                    );
                  },
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: GestureDetector(
                  onTap: onFavoritePressed,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      destination.isFavorite
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color:
                          destination.isFavorite ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Title and Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                destination.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    destination.rating.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          // Location
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.grey, size: 16),
              const SizedBox(width: 4),
              Text(
                destination.location,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onNavItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 20,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class Homepage extends StatelessWidget {
//   const Homepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // drawer: Column(children: []),
//       appBar: AppBar(
//         centerTitle: false,
//         title: TextButton(
//           onPressed: () {
//             //return to user profile
//           },
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ClipOval(
//                 child: Image.network(
//                     height: 20,
//                     width: 20,
//                     fit: BoxFit.contain,
//                     'data:image/jpeg;base64,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'),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text('Username'),
//             ],
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notification_add),
//             onPressed: () {},
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // BottomNavigationBar(items: <BottomNavigationBarItem>[
//             //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//             // ])
//           ],
//         ),
//       ),
//       bottomNavigationBar: ,
//     );
//   }
// }
