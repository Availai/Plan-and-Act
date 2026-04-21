import 'package:flutter/material.dart';

/// Semantic color palette for Plan and Act.
/// Focus & Flow - Linear/Apple Minimalist Aesthetic
class AppColors {
  AppColors._();

  // Branding Core
  static const Color primary = Color(0xFF5856D6); // Modern Indigo
  static const Color primaryLight = Color(0xFF6E6CDA);
  
  static const Color accentBlue = Color(0xFF0A84FF); // iOS Blue action
  static const Color accentGreen = Color(0xFF34C759); // Emerald Green
  static const Color accentAmber = Color(0xFFFF9F0A);
  static const Color accentRed = Color(0xFFFF453A); // Destructive action

  // Backgrounds - Light Mode (Modern Paper)
  static const Color backgroundLight = Color(0xFFFFFFFF); // Pure White
  static const Color surfaceLight = Color(0xFFF2F2F7); // iOS Grouped Background
  
  // Backgrounds - Dark Mode (OLED Deep)
  static const Color backgroundDark = Color(0xFF000000); // OLED True Black
  static const Color surfaceDark = Color(0xFF1C1C1E); // Elevated Surface

  // Priorities
  static const Color priorityHigh = accentRed;
  static const Color priorityMedium = accentAmber;
  static const Color priorityLow = accentBlue;

  // Typography - Light
  static const Color textHighEmphasisLight = Color(0xFF000000);
  static const Color textMediumEmphasisLight = Color(0xFF8E8E93);
  static const Color textLowEmphasisLight = Color(0xFFC7C7CC);

  // Typography - Dark
  static const Color textHighEmphasisDark = Color(0xFFFFFFFF);
  static const Color textMediumEmphasisDark = Color(0xFF8E8E93);
  static const Color textLowEmphasisDark = Color(0xFF636366);

  // Borders & Dividers
  static const Color borderLight = Color(0xFFE5E5EA);
  static const Color borderDark = Color(0xFF38383A);
}
