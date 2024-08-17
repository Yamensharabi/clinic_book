import 'package:clinbook/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeArabic = ThemeData(
      // appBarTheme: AppBarTheme(backgroundColor: Brightness.light),
      textTheme: TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColors.mainColor,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      color: AppColors.thirdColor,
    ),
    titleSmall: TextStyle(
      fontSize: 18,
      color: AppColors.mainColor,
    ),
    bodyLarge: TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      decoration: TextDecoration.none,
    ),
    bodyMedium: TextStyle(
      color: AppColors.mainColor,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      color: AppColors.mainColor,
      fontSize: 12,
    ),
  ));
}
