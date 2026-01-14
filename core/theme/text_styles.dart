import 'package:flutter/material.dart';
import 'app_colors.dart';

class TextStyles {
  // Heading Styles
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: 'Poppins',
    height: 1.2,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: 'Poppins',
    height: 1.3,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: 'Poppins',
    height: 1.4,
  );

  // Body Styles
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    fontFamily: 'Inter',
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    fontFamily: 'Inter',
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textLight,
    fontFamily: 'Inter',
    height: 1.5,
  );

  // Button Styles
  static const TextStyle buttonLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'Poppins',
    letterSpacing: 0.5,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'Poppins',
    letterSpacing: 0.5,
  );

  // Arabic Text Styles
  static const TextStyle arabicLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    fontFamily: 'Uthmanic',
    height: 1.8,
  );

  static const TextStyle arabicMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    fontFamily: 'Uthmanic',
    height: 1.8,
  );

  // Special Styles
  static const TextStyle prayerTime = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Poppins',
    letterSpacing: 1.0,
  );

  static const TextStyle duaArabic = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.normal,
    color: AppColors.primary,
    fontFamily: 'Uthmanic',
    height: 2.0,
  );

  // Dark Theme Text Styles
  static const TextStyle heading1Dark = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Poppins',
    height: 1.2,
  );

  static const TextStyle heading2Dark = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'Poppins',
    height: 1.3,
  );

  static const TextStyle heading3Dark = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'Poppins',
    height: 1.4,
  );

  // Body Styles Dark
  static const TextStyle bodyLargeDark = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Colors.white70,
    fontFamily: 'Inter',
    height: 1.5,
  );

  static const TextStyle bodyMediumDark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.white60,
    fontFamily: 'Inter',
    height: 1.5,
  );

  static const TextStyle bodySmallDark = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.white54,
    fontFamily: 'Inter',
    height: 1.5,
  );
}
