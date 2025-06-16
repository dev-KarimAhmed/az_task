import 'package:az_task/core/routes/app_routes.dart';
import 'package:az_task/core/theme/app_theme.dart';
import 'package:flutter/material.dart';


class AZTask extends StatelessWidget {
  const AZTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AZ Task',
      theme: AppTheme.darkTheme,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.splashScreen,
      
    );
  }
}
