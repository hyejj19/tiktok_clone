import 'package:go_router/go_router.dart';
import 'package:tiktok_code_challenge01/features/authentication/email_screen.dart';
import 'package:tiktok_code_challenge01/features/authentication/login_screen.dart';
import 'package:tiktok_code_challenge01/features/authentication/sign_up_screen.dart';
import 'package:tiktok_code_challenge01/features/authentication/username_screen.dart';
import 'package:tiktok_code_challenge01/features/users/user_profile_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        path: SignUpScreen.routeURL,
        name: SignUpScreen.routeName,
        builder: (context, state) => const SignUpScreen(),
        routes: [
          GoRoute(
              path: UsernameScreen.routeURL,
              name: UsernameScreen.routeName,
              builder: (context, state) => const UsernameScreen(),
              routes: [
                GoRoute(
                  path: EmailScreen.routeName,
                  name: EmailScreen.routeName,
                  builder: (context, state) {
                    final args = state.extra as EmailScreenArgs;

                    return EmailScreen(username: args.username);
                  },
                ),
              ]),
        ]),
    // GoRoute(
    //   path: LoginScreen.routeName,
    //   builder: (context, state) => LoginScreen(),
    // ),
    // GoRoute(
    //   path: UsernameScreen.routeName,
    //   name: 'username_screen',
    //   pageBuilder: (context, state) {
    //     return CustomTransitionPage(
    //       child: UsernameScreen(),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return FadeTransition(
    //           opacity: animation,
    //           child: ScaleTransition(
    //             scale: animation,
    //             child: child,
    //           ),
    //         );
    //       },
    //     );
    //   },
    // ),

    GoRoute(
      path: "/users/:username",
      builder: (context, state) {
        final username = state.params['username'];
        final tab = state.queryParams['show'];

        return UserProfileScreen(username: username!, tab: tab!);
      },
    ),
  ],
);
