import 'package:flutter_project/from.dart';
import 'package:flutter_project/pages/homepage.dart';
import 'package:flutter_project/pages/onboarding.dart';
import 'package:flutter_project/pages/signin.dart';
// ignore: unused_import
import 'package:flutter_project/pages/signinup.dart';
import 'package:flutter_project/pages/splash.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(initialLocation: '/splash', routes: [
  GoRoute(
    name: 'splash',
    path: '/splash',
    builder: (context, state) => const Splash(),
  ),
  GoRoute(
    name: 'onboard',
    path: '/onboard',
    builder: (context, state) => const OnboardingScreen(),
  ),
  // GoRoute(
  //     path: '/homepage',
  //     name: 'homepage',
  //     builder: (context, state) => const Fromexample()),
  GoRoute(
      path: '/signin',
      name: 'signin',
      builder: (context, state) => const Signin())
]);
