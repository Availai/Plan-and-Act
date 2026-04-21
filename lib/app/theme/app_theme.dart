import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/app/theme/app_spacing.dart';

/// Pre-configured Material 3 theme integrating AppColors and AppSpacing.
class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final base = ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.accentBlue,
        surface: AppColors.surfaceLight,
        error: AppColors.accentRed,
      ),
      scaffoldBackgroundColor: AppColors.backgroundLight,
      useMaterial3: true,
    );

    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme).copyWith(
        displayLarge: GoogleFonts.outfit(
          fontWeight: FontWeight.w800,
          color: AppColors.textHighEmphasisLight,
        ),
        displayMedium: GoogleFonts.outfit(
          fontWeight: FontWeight.w800,
          color: AppColors.textHighEmphasisLight,
        ),
        headlineLarge: GoogleFonts.outfit(
          fontWeight: FontWeight.w700,
          color: AppColors.textHighEmphasisLight,
        ),
        headlineMedium: GoogleFonts.outfit(
          fontWeight: FontWeight.w700,
          color: AppColors.textHighEmphasisLight,
        ),
        titleLarge: GoogleFonts.outfit(
          fontWeight: FontWeight.w700,
          color: AppColors.textHighEmphasisLight,
        ),
        titleMedium: GoogleFonts.outfit(
          fontWeight: FontWeight.w600,
          color: AppColors.textHighEmphasisLight,
        ),
        bodyLarge: GoogleFonts.inter(
          color: AppColors.textMediumEmphasisLight,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: GoogleFonts.inter(
          color: AppColors.textMediumEmphasisLight,
        ),
        bodySmall: GoogleFonts.inter(
          color: AppColors.textLowEmphasisLight,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.primary),
        titleTextStyle: TextStyle(
          color: AppColors.textHighEmphasisLight,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceLight,
        elevation: 1,
        shadowColor: AppColors.primary.withValues(alpha: 0.05),
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.borderLight),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.borderLight,
        thickness: 1,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.surfaceLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
        ),
      ),
    );
  }

  static ThemeData get dark {
    final base = ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.neonCyan,
        secondary: AppColors.neonPink,
        surface: AppColors.surfaceDark,
        error: AppColors.neonOrange,
      ),
      scaffoldBackgroundColor: AppColors.backgroundDark,
      useMaterial3: true,
    );

    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme).copyWith(
        displayLarge: GoogleFonts.outfit(
          fontWeight: FontWeight.w800,
          color: AppColors.textHighEmphasisDark,
        ),
        displayMedium: GoogleFonts.outfit(
          fontWeight: FontWeight.w800,
          color: AppColors.textHighEmphasisDark,
        ),
        headlineLarge: GoogleFonts.outfit(
          fontWeight: FontWeight.w700,
          color: AppColors.textHighEmphasisDark,
        ),
        headlineMedium: GoogleFonts.outfit(
          fontWeight: FontWeight.w700,
          color: AppColors.textHighEmphasisDark,
        ),
        titleLarge: GoogleFonts.outfit(
          fontWeight: FontWeight.w700,
          color: AppColors.textHighEmphasisDark,
        ),
        titleMedium: GoogleFonts.outfit(
          fontWeight: FontWeight.w600,
          color: AppColors.textHighEmphasisDark,
        ),
        bodyLarge: GoogleFonts.inter(
          color: AppColors.textMediumEmphasisDark,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: GoogleFonts.inter(
          color: AppColors.textMediumEmphasisDark,
        ),
        bodySmall: GoogleFonts.inter(
          color: AppColors.textLowEmphasisDark,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.surfaceLight),
        titleTextStyle: TextStyle(
          color: AppColors.textHighEmphasisDark,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceDark,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.white10),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.borderDark,
        thickness: 1,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.neonCyan,
        foregroundColor: AppColors.backgroundDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
        ),
      ),
    );
  }
}
