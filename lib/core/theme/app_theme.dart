import 'package:az_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Poppins",
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    cardColor: AppColors.surfaceLight,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.textPrimaryLight,
        fontFamily: "Poppins",
      ),
      bodyMedium: TextStyle(color: AppColors.textSecondaryLight ,fontFamily: "Poppins",),
      titleLarge: TextStyle(
        color: AppColors.textPrimaryLight,
        fontFamily: "Poppins",
      ),
      titleMedium: TextStyle(
        color: AppColors.textSecondaryLight,
        fontFamily: "Poppins",
      ),
    ),
    // Add more theme properties as needed
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "Poppins",
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    cardColor: AppColors.surfaceDark,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.textPrimaryDark,
        fontFamily: "Poppins",
      ),
      bodyMedium: TextStyle(
        color: AppColors.textSecondaryDark,
        fontFamily: "Poppins",
      ),
      titleLarge: TextStyle(
        color: AppColors.textPrimaryDark,
        fontFamily: "Poppins",
      ),
      titleMedium: TextStyle(
        color: AppColors.textSecondaryDark,
        fontFamily: "Poppins",
      ),
    ),
    // Add more theme properties as needed
  );
}
