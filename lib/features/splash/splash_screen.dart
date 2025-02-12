import 'package:doctors_speciality/core/helpers/app_images.dart';
import 'package:doctors_speciality/core/helpers/extentsions.dart';
import 'package:doctors_speciality/core/routing/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تأخير لعرض الشاشة لمدة 3 ثواني (مثال)
    Future.delayed(Duration(seconds: 1), () {
      context.pushNamed(Routes.onBoardingScreen);
    });

    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.splash), // صورة شاشة البداية
      ),
    );
  }
}