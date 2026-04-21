import 'package:flutter/material.dart';

/// Dracula-inspired semantic palette for Plan and Act.
/// Focus & Flow - Linear/Apple Minimalist Aesthetic
class AppColors {
  AppColors._();

  static const Color pageBackground = Color(0xFF282A36);
  static const Color pageBackgroundDeep = Color(0xFF232530);
  static const Color panelBackground = Color(0xFF1E1F29);
  static const Color panelElevated = Color(0xFF343746);
  static const Color panelOverlay = Color(0xFF44475A);
  static const Color borderSubtle = Color(0xFF4C5070);

  static const Color textPrimary = Color(0xFFF8F8F2);
  static const Color textSecondary = Color(0xFFB8C1EC);
  static const Color textMuted = Color(0xFF7F88B5);

  static const Color accentCyan = Color(0xFF8BE9FD);
  static const Color accentPink = Color(0xFFFF79C6);
  static const Color accentPurple = Color(0xFFBD93F9);
  static const Color success = Color(0xFF50FA7B);
  static const Color warning = Color(0xFFFFB86C);
  static const Color danger = Color(0xFFFF5555);

  static const Color primary = accentPurple;
  static const Color info = accentCyan;
  static const Color priorityHigh = danger;
  static const Color priorityMedium = warning;
  static const Color priorityLow = accentCyan;

  static const Color shimmerBase = Color(0xFF2E3140);
  static const Color shimmerHighlight = Color(0xFF41455A);

  static const Color actionForeground = pageBackground;

  static Color laneColor(String? laneId) {
    switch (laneId) {
      case 'critical':
        return accentPink;
      case 'must_do':
        return accentCyan;
      case 'challenging':
        return warning;
      case 'chore_useful':
        return success;
      default:
        return accentPurple;
    }
  }

  static Color statusColor(String statusName) {
    switch (statusName) {
      case 'completed':
        return success;
      case 'canceled':
        return danger;
      case 'postponed':
        return warning;
      case 'planned':
        return accentCyan;
      case 'skipped':
        return panelOverlay;
      default:
        return textMuted;
    }
  }
}
