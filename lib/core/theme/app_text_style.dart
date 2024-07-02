import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
  static const TextStyle headline2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.darckTextColor,
  );
  static const TextStyle headline3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static const TextStyle headline4 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.darckTextColor,
  );
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 18,
    color: AppColors.darckTextColor,
  );
  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    color: Colors.white,
  );
  static const TextStyle subtleText = TextStyle(
    fontSize: 16,
    color: AppColors.subtleTextColor,
  );
}
