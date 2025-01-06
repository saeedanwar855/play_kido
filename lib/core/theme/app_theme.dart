import 'package:flutter/material.dart';
import 'package:play_kido/core/app_text_styles/text_styles.dart';
import 'package:play_kido/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryOrange,
      colorScheme: const ColorScheme.light(
        primary: AppColors.secondaryOrange,
        secondary: AppColors.complementaryBlue,
      ),
      fontFamily: 'Poppins',
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        displaySmall: AppTextStyles.displaySmall,
        headlineLarge: AppTextStyles.headingLarge,
        headlineMedium: AppTextStyles.headingMedium,
        headlineSmall: AppTextStyles.headingSmall,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.secondaryOrange,
        foregroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: AppTextStyles.headingLarge,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryOrange,
          foregroundColor: Colors.white,
          textStyle: AppTextStyles.buttonMedium,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
