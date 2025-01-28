import 'package:flutter/material.dart';
import 'package:flutter_project/data.dart';
import 'package:flutter_project/widget/popularplace_card.dart';
import 'package:go_router/go_router.dart';

class PopularPlaces extends StatelessWidget {
  const PopularPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            return context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Title(
          color: Colors.white,
          child: const Text(
            'Popular Places',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'All Popular Places',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 24, mainAxisSpacing: 24),
              itemBuilder: (context, index) {
                return PopularPlaceCards(popularCard: destinations[index]);
              },
              itemCount: destinations.length,
            ),
          ],
        ),
      ),
    );
  }
}
