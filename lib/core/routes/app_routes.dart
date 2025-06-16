// ignore_for_file: unused_local_variable

import 'package:az_task/core/routes/base_route.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/';
  static const splashScreen = '/splashScreen';
  static const onboardingScreen = '/onboardingScreen';
  static const loginScreen = '/loginScreen';
  static const dashboardScreen = '/dashboardScreen';


   static Route<void> onGenerateRout(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
   
      
      default:
        return BaseRoute(page: const Scaffold(
          body: Center(
            child: Text('No route defined for This Page'),
          ),
        ));
    }
  }
}