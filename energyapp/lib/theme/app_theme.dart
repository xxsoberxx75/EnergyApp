// lib/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppColors {
  // From you
  static const Color navy = Color(0xFF001D39);
  static const Color blue = Color(0xFF0A4174);
  static const Color steel = Color(0xFF49769F);
  static const Color white = Color(0xFFFFFFFF);

  // Helper
  static const Color correct = Color(0xFF2ECC71);
  static const Color wrong = Color(0xFFE74C3C);
}

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: false,
    primaryColor: AppColors.blue,
    scaffoldBackgroundColor: AppColors.navy,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.white),
    ),
  );
}
