import 'package:doctors_speciality/core/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        // return MaterialPageRoute(
        //   builder: (_) => const OnboardingScreen(),
        // );
      case Routes.loginScreen:
        // return MaterialPageRoute(
        //   builder: (_) => const LoginScreen(),
        // );
      case Routes.signUpScreen:
        // return MaterialPageRoute(
        //   builder: (_) => const SignupScreen(),
        // );
      case Routes.homeScreen:
        // return MaterialPageRoute(
        //   builder: (_) => const HomeScreen(),
        // );
      default:
        return null;
    }
  }
}