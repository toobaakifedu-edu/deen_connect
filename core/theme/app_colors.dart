import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors (Green Theme like Islam360)
  static const Color primary = Color(0xFF0A6D0A);
  static const Color primaryDark = Color(0xFF064706);
  static const Color primaryLight = Color(0xFF4CAF50);
  static const Color primaryExtraLight = Color(0xFFE8F5E9);

  // Secondary Colors
  static const Color secondary = Color(0xFFFFD700); // Gold
  static const Color accent = Color(0xFF2196F3);
  static const Color error = Color(0xFFF44336);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);

  // Background Colors
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1E1E1E);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFF9E9E9E);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Border Colors
  static const Color borderLight = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFF424242);

  // Prayer Time Colors
  static const Color fajrColor = Color(0xFF5C6BC0);
  static const Color sunriseColor = Color(0xFFFF9800);
  static const Color dhuhrColor = Color(0xFF4CAF50);
  static const Color asrColor = Color(0xFF2196F3);
  static const Color maghribColor = Color(0xFFF44336);
  static const Color ishaColor = Color(0xFF673AB7);

  // Gradient Colors
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0A6D0A), Color(0xFF4CAF50)],
  );

  static const Gradient sunsetGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFF9800), Color(0xFFF44336)],
  );

  static const Gradient nightGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF5C6BC0), Color(0xFF673AB7)],
  );
}
