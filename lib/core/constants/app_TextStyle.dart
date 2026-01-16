import 'package:flutter/material.dart';
import 'package:test_app/core/constants/app_colors.dart';

class AppTextstyle {
  static const TextStyle bodyText = TextStyle(
    color: AppColors.backgroundPrimaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Monserrat',
  );

  static const TextStyle subTitleText = TextStyle(
    color: AppColors.backgroundPrimaryColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'Monserrat',
  );

  static const TextStyle titleText = TextStyle(
    color: AppColors.backgroundPrimaryColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Monserrat',
  );

  static const TextStyle bodySecondaryText = TextStyle(
    color: AppColors.backgroundSecondaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Monserrat',
  );

   static const TextStyle subTitleSecondaryText = TextStyle(
    color: AppColors.backgroundSecondaryColor,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: 'Monserrat',
  );

  static const TextStyle titleSecondatyText = TextStyle(
    color: AppColors.backgroundSecondaryColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Monserrat',
  );

  static const TextStyle bodyTertiaryText = TextStyle(
    color: AppColors.buttomColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Monserrat',
  );
}
