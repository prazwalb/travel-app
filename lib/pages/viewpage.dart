import 'package:flutter/material.dart';
import 'package:flutter_project/data.dart';
import 'package:go_router/go_router.dart';

class Viewpage extends StatelessWidget {
  final String destinationId;
  const Viewpage({super.key, required this.destinationId});

  @override
  Widget build(BuildContext context) {
    final view =
        destinations.firstWhere((element) => element.id == destinationId);
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: kToolbarHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                view.image,
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              onPressed: context.pop,
              icon: Icon(Icons.arrow_back_ios_new),
            ),
            title: Text('view'),
            centerTitle: true,
          ),
          SliverFillRemaining(
            child: Image.network(
              view.image,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
