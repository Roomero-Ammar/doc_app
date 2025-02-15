import 'package:doctors_speciality/core/routing/app_router.dart';
import 'package:doctors_speciality/core/service_locator/dependency_injection.dart';
import 'package:doctors_speciality/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(DocApp(appRouter: AppRouter(),
));
}

