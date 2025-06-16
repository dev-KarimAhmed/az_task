import 'package:az_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  cardColor: AppColors.surfaceLight,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColors.textPrimaryLight),
    bodyMedium: TextStyle(color: AppColors.textSecondaryLight),
  ),
  // Add more theme properties as needed
);

ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.backgroundDark,
  cardColor: AppColors.surfaceDark,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColors.textPrimaryDark),
    bodyMedium: TextStyle(color: AppColors.textSecondaryDark),
  ),
  // Add more theme properties as needed
);