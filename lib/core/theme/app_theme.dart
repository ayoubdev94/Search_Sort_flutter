import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.primaryBackground,
      textTheme: TextTheme(
        displayLarge: AppTextStyles.headline1,
        bodyLarge: AppTextStyles.bodyText1,
        labelLarge: AppTextStyles.buttonText,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonColor,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: AppTextStyles.buttonText,
        ),
      ),
    );
  }
}
