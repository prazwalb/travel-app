import 'package:flutter/material.dart';
import 'package:flutter_project/data.dart';

class PopularPlaceCards extends StatelessWidget {
  final Destination popularCard;
  const PopularPlaceCards({super.key, required this.popularCard});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10,
                spreadRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        popularCard.image,
                        // height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                popularCard.name,
                style: const TextStyle(fontSize: 25),
              ),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  Text(popularCard.location)
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const Icon(Icons.star, color: Colors.amber),
                  const Icon(Icons.star, color: Colors.amber),
                  Text(popularCard.rating.toString()),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: popularCard.pricePerperson.toString(),
                      style: const TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                    const TextSpan(
                        text: '/Person', style: TextStyle(fontSize: 18))
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
