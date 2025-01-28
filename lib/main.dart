import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/conversation_controller.dart';
import 'package:flutter_project/controllers/destination_controller.dart';
import 'package:flutter_project/navigation/routing.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DestinationController>(
            create: (_) => DestinationController()),
        ChangeNotifierProvider<ConversationController>(
            create: (_) => ConversationController()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
    // return ChangeNotifierProvider(
    //   create: (context) => DestinationController(),
    //   child: MaterialApp.router(
    //     debugShowCheckedModeBanner: false,
    //     routerConfig: router,
    //   ),
    // );
  }
}
