import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/conversation_controller.dart';
import 'package:flutter_project/layout/home_layout.dart';
import 'package:flutter_project/pages/detailpage.dart';
import 'package:flutter_project/pages/editprofilepage.dart';
import 'package:flutter_project/pages/forgetpassword.dart';
import 'package:flutter_project/pages/homepage.dart';
import 'package:flutter_project/pages/messagepage/messagedetail.dart';
import 'package:flutter_project/pages/messagepage/messages_home.dart';
import 'package:flutter_project/pages/onboarding.dart';
import 'package:flutter_project/pages/popularpackages.dart';
import 'package:flutter_project/pages/popularplaces.dart';
import 'package:flutter_project/pages/profilepage.dart';
import 'package:flutter_project/pages/schedule.dart';
import 'package:flutter_project/pages/signin.dart';
import 'package:flutter_project/pages/signup.dart';
import 'package:flutter_project/pages/splash.dart';
import 'package:flutter_project/pages/viewpage.dart';
import 'package:flutter_project/widget/message_card.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> _parentNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _parentNavigatorKey,
  initialLocation: '/splash',
  routes: [
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
            builder: (context, state) => const Forgotpassword(),
          ),
        ]),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const Signup(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeLayout(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/homepage',
              name: 'homepage',
              builder: (context, state) => const Homepage(),
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
                        path: ':viewId',
                        name: 'viewpage',
                        builder: (context, state) => Viewpage(
                          viewId: state.pathParameters['viewId']!,
                        ),
                        // routes: [
                        //   GoRoute(
                        //       path: 'schedulepage',
                        //       name: 'schedulepage',
                        //       builder: (context, state) => Schedule())
                        // ],
                      )
                    ]),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: '/schedulepage',
                name: 'schedulepage',
                builder: (context, state) => Schedule())
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: '/profilepage',
                name: 'profilepage',
                builder: (context, state) => const Profilepage(),
                routes: [
                  GoRoute(
                      path: 'editprofile',
                      name: 'editprofile',
                      builder: (context, state) {
                        return const Editprofile();
                      },
                      parentNavigatorKey: _parentNavigatorKey)
                ])
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/messages',
              name: 'messages',
              builder: (context, state) => MessageHome(),
              routes: [
                GoRoute(
                  path: ':username',
                  name: 'message-details',
                  parentNavigatorKey: _parentNavigatorKey,
                  builder: (context, state) {
                    final username = state.pathParameters['username'];
                    final conversation = context
                        .watch<ConversationController>()
                        .conversations
                        .firstWhere((c) => c.userName == username);
                    return MessageDetails(
                      conversation: conversation,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/photos',
      name: 'photos',
      builder: (context, state) => Schedule(),
    ),
    GoRoute(
      path: '/popularplace',
      name: 'popularplace',
      builder: (context, index) {
        return const PopularPlaces();
      },
    ),
    GoRoute(
      path: '/popularpackages',
      name: 'popularpackages',
      builder: (context, state) {
        return const Popularpackages();
      },
    )
  ],
);
