import 'package:evently_app/theme/app_color.dart';
import 'package:evently_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    splashColor: AppColors.black,
    cardColor: AppColors.inputlight,
    focusColor: AppColors.strokelight,
     hintColor: AppColors.lightText,
     hoverColor: AppColors.lightprimary,
    brightness: Brightness.light,
    primaryColor:AppColors.lightprimary ,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: ColorScheme.fromSeed(
     seedColor: AppColors.lightprimary,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      foregroundColor:Colors.black,
      centerTitle: true,
      elevation: 0,
      
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyle.styleS24W700.copyWith(color: AppColors.lightText),
      headlineMedium:  AppTextStyle.styleS30W600.copyWith(color: AppColors.lightText),
bodyLarge: AppTextStyle.styleS16W500.copyWith( color:  AppColors.lightText),   
   bodyMedium: AppTextStyle.  styleS14W400 .copyWith( color:  AppColors.lightText),   
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
     splashColor: AppColors.whiteText,
   hintColor: AppColors.darkText,
    hoverColor: AppColors.whiteText,
     cardColor: AppColors.inputDark,
    focusColor: AppColors.strokeDark,
    primaryColor:AppColors.darkprimary ,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkprimary,
      brightness: Brightness.dark,
      
    ),
    appBarTheme: const AppBarTheme(
      
      backgroundColor: AppColors.darkBackground,
      foregroundColor:AppColors.darkprimary,
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: TextTheme(
      
      headlineLarge: AppTextStyle.styleS24W700.copyWith(color: AppColors.darkText),
      headlineMedium:  AppTextStyle.styleS30W600.copyWith(color: AppColors.darkText),
bodyLarge: AppTextStyle.styleS16W500.copyWith(
  color: AppColors.darkText,
),   bodyMedium: AppTextStyle.  styleS14W400.copyWith( color:  AppColors.darkText),   
    ),
  );
}
