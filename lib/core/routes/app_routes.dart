// ignore_for_file: unused_local_variable

import 'package:az_task/core/routes/base_route.dart';
import 'package:az_task/features/authentication/ui/views/login_screen.dart';
import 'package:az_task/features/dashboard/ui/views/dashboard_screen.dart';
import 'package:az_task/features/onboarding_screen/ui/views/last_view.dart';
import 'package:az_task/features/onboarding_screen/ui/views/onboarding_view.dart';
import 'package:az_task/features/splash_screen/ui/views/splash_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/';
  static const splashScreen = '/splashScreen';
  static const onboardingScreen = '/onboardingScreen';
  static const loginScreen = '/loginScreen';
  static const dashboardScreen = '/dashboardScreen';
  static const lastView = '/lastview';

  static Route<void>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case splashScreen:
        return BaseRoute(page: SplashScreen());
      case onboardingScreen:
        return BaseRoute(page: const OnboardingScreen());
      case lastView:
        return BaseRoute(page: const LastView());
      case loginScreen:
        return BaseRoute(page: LoginScreen());
      case dashboardScreen:
        return BaseRoute(page: const DashboardScreen());  
      default:
        return null;
    }
  }
}
