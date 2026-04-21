import 'package:flutter/material.dart';

/// Curated color palette for Plan and Act.
///
/// Design language: premium dark theme with purple accent.
/// Not visually noisy, high readability, restrained but elegant.
class AppColors {
  AppColors._();

  // ─── Brand / Accent ───────────────────────────────────────
  static const Color primary = Color(0xFF7B61FF);
  static const Color primaryLight = Color(0xFF95A0FF);
  static const Color primaryMuted = Color(0xFF5A4FCF);

  // ─── Surfaces ─────────────────────────────────────────────
  static const Color scaffoldBackground = Color(0xFF070B1A);
  static const Color cardBackground = Color(0xFF121A33);
  static const Color surfaceElevated = Color(0xFF1A2242);
  static const Color navBarBackground = Color(0xFF0C1328);

  // ─── Text ─────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFFF0F0F5);
  static const Color textSecondary = Color(0xFFA0A8C4);
  static const Color textMuted = Color(0xFF6B7394);

  // ─── Status ───────────────────────────────────────────────
  static const Color success = Color(0xFF4ADE80);
  static const Color warning = Color(0xFFFBBF24);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF60A5FA);

  // ─── Others ───────────────────────────────────────────────
  static const Color divider = Color(0xFF1E2A4A);
  static const Color shimmerBase = Color(0xFF1A2242);
  static const Color shimmerHighlight = Color(0xFF253060);
}
