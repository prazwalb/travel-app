import 'package:flutter_project/data.dart';
import 'package:flutter_project/pages/detailpage.dart';
import 'package:flutter_project/pages/forgetpassword.dart';
import 'package:flutter_project/pages/homepage.dart';
import 'package:flutter_project/pages/onboarding.dart';
import 'package:flutter_project/pages/signin.dart';
import 'package:flutter_project/pages/signup.dart';
import 'package:flutter_project/pages/splash.dart';
import 'package:flutter_project/pages/viewpage.dart';
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
  GoRoute(
      path: '/signin',
      name: 'signin',
      builder: (context, state) => const Signin(),
      routes: [
        GoRoute(
          path: '/forgotpass',
          name: 'forgotpass',
          builder: (context, state) => Forgotpassword(),
        ),
      ]),
  GoRoute(
    path: '/signup',
    name: 'signup',
    builder: (context, state) => Signup(),
  ),

  GoRoute(
      path: '/homepage',
      name: 'homepage',
      builder: (context, state) => Homepage(),
      routes: [
        // GoRoute(
        //   path: 'otpverification',
        //   name: 'otpverification',
        //   builder: (context, state) {
        //     return OtpVerification();
        //   },
        // ),
        GoRoute(
            path: ':destinationId',
            name: 'detailspage',
            builder: (context, state) => DestinationDetailsPage(
                destinationId: state.pathParameters['destinationId']!),
            routes: [
              GoRoute(
                path: 'destinationId',
                name: 'viewpage',
                builder: (context, state) => Viewpage(
                  destinationId: state.pathParameters['destinationId']!,
                ),
              )
            ]),
      ]),
  // GoRoute(
  //   path: '/detailpage',
  //   name: 'detailpage',
  //   // builder: (context, state) => DestinationDetailsPage())
  // )
]);
