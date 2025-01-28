import 'package:flutter/material.dart';
import 'package:flutter_project/data.dart';
import 'package:flutter_project/widget/popularplace_card.dart';
import 'package:go_router/go_router.dart';

class Popularpackages extends StatelessWidget {
  const Popularpackages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Places"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            return context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('All Popular Packages'),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                  itemBuilder: (context, index) {
                    return PopularPlaceCards(popularCard: destinations[index]);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: destinations.length)
            ],
          )
        ],
      ),
    );
  }
}
