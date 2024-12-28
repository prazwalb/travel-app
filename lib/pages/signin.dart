import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Column(children: [
            BackButton(
              onPressed: () {
                return context.goNamed('onboard');
              },
            ),
            Text(
              'Sign up now',
              style: TextStyle(),
            )
          ])),
    );
  }
}
