import 'package:doctors_speciality/core/routing/routes.dart';
import 'package:doctors_speciality/core/service_locator/dependency_injection.dart';
import 'package:doctors_speciality/features/home/logic/cubit/home_cubit.dart';
import 'package:doctors_speciality/features/home/ui/home_screen.dart';
import 'package:doctors_speciality/features/login/logic/cubit/login_cubit.dart';
import 'package:doctors_speciality/features/login/ui/login_screen.dart';
import 'package:doctors_speciality/features/onboarding/onboarding_screen.dart';
import 'package:doctors_speciality/features/sign_up/logic/sign_up_cubit.dart';
import 'package:doctors_speciality/features/sign_up/ui/sign_up_screen.dart';
import 'package:doctors_speciality/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );

      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt()),
            child: const HomeScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
