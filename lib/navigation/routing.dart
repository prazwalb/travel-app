import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/conversation_controller.dart';
import 'package:flutter_project/layout/home_layout.dart';
import 'package:flutter_project/pages/detailpage.dart';
import 'package:flutter_project/pages/editprofilepage.dart';
import 'package:flutter_project/pages/notifications.dart';
import 'package:flutter_project/pages/search_page/searchpage.dart';
import 'package:flutter_project/pages/signin_signup_page/forgotpassword.dart';
import 'package:flutter_project/pages/homepage.dart';
import 'package:flutter_project/pages/message_page/messagedetail.dart';
import 'package:flutter_project/pages/message_page/messages_home.dart';
import 'package:flutter_project/pages/onboard_page/onboarding.dart';
import 'package:flutter_project/pages/popularpackages.dart';
import 'package:flutter_project/pages/popularplaces.dart';
import 'package:flutter_project/pages/profilepage.dart';
import 'package:flutter_project/pages/schedule.dart';
import 'package:flutter_project/pages/signin_signup_page/otp_verification.dart';
import 'package:flutter_project/pages/signin_signup_page/signin.dart';
import 'package:flutter_project/pages/signin_signup_page/signup.dart';
import 'package:flutter_project/pages/splash_page/splash.dart';
import 'package:flutter_project/pages/viewpage.dart';
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
              builder: (context, state) => const ForgotPassword(),
              routes: [
                GoRoute(
                  path: '/otpverification',
                  name: 'otpverification',
                  builder: (context, state) => OtpVerificationPage(),
                )
              ]),
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
                GoRoute(
                    path: 'notifications',
                    name: 'notifications',
                    builder: (context, state) => NotificationPage(),
                    parentNavigatorKey: _parentNavigatorKey),
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
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/schedulepage',
              name: 'schedulepage',
              builder: (context, state) => Schedule(),
            )
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/searchpage',
              name: 'searchpage',
              builder: (context, state) => Searchpage(),
            ),
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
                        return EditProfile();
                      },
                      parentNavigatorKey: _parentNavigatorKey)
                ])
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
