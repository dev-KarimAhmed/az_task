import 'package:az_task/core/app/theme_cubit/theme_cubit.dart.dart';
import 'package:az_task/core/routes/app_routes.dart';
import 'package:az_task/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AZTask extends StatelessWidget {
  const AZTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit()..loadTheme(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder<ThemeCubit , bool>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'AZ Task',
              theme: state ? AppTheme.darkTheme : AppTheme.lightTheme,
              onGenerateRoute: AppRoutes.onGenerateRoute,
              initialRoute: AppRoutes.splashScreen,
            );
          },
        ),
      ),
    );
  }
}
