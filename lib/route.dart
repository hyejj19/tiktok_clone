import 'package:go_router/go_router.dart';
import 'package:tiktok_code_challenge01/features/authentication/login_screen.dart';
import 'package:tiktok_code_challenge01/features/authentication/sign_up_screen.dart';
import 'package:tiktok_code_challenge01/features/onboarding/interests_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: SignUpScreen.routeURL,
      name: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeURL,
      name: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: InterestsScreen.routeURL,
      name: InterestsScreen.routeName,
      builder: (context, state) => const InterestsScreen(),
    ),
  ],
);
