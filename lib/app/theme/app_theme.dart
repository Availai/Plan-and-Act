import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/app/theme/app_spacing.dart';

/// Dark-only application theme with a restrained Dracula neon foundation.
class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    final base = ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.accentPink,
        surface: AppColors.panelBackground,
        error: AppColors.danger,
        onPrimary: AppColors.actionForeground,
        onSecondary: AppColors.actionForeground,
        onSurface: AppColors.textPrimary,
        onError: AppColors.actionForeground,
      ),
      scaffoldBackgroundColor: AppColors.pageBackground,
      useMaterial3: true,
    );

    final textTheme = GoogleFonts.ibmPlexSansTextTheme(base.textTheme).copyWith(
      displayLarge: GoogleFonts.jetBrainsMono(
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
      ),
      displayMedium: GoogleFonts.jetBrainsMono(
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
      ),
      headlineLarge: GoogleFonts.jetBrainsMono(
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
      ),
      headlineMedium: GoogleFonts.jetBrainsMono(
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
      headlineSmall: GoogleFonts.jetBrainsMono(
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
      titleLarge: GoogleFonts.jetBrainsMono(
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
      titleMedium: GoogleFonts.jetBrainsMono(
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      titleSmall: GoogleFonts.jetBrainsMono(
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
      ),
      labelLarge: GoogleFonts.jetBrainsMono(
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
      labelMedium: GoogleFonts.jetBrainsMono(
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
      ),
      bodyLarge: GoogleFonts.ibmPlexSans(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.ibmPlexSans(
        color: AppColors.textSecondary,
      ),
      bodySmall: GoogleFonts.ibmPlexSans(
        color: AppColors.textMuted,
      ),
    );

    return base.copyWith(
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardThemeData(
        color: AppColors.panelBackground,
        elevation: 0,
        shadowColor: AppColors.accentCyan.withValues(alpha: 0.08),
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: AppColors.borderSubtle),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.borderSubtle,
        thickness: 1,
      ),
      iconTheme: const IconThemeData(color: AppColors.textSecondary),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.accentPink,
        foregroundColor: AppColors.actionForeground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.panelBackground.withValues(alpha: 0.96),
        indicatorColor: AppColors.accentCyan.withValues(alpha: 0.18),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final color = states.contains(WidgetState.selected)
              ? AppColors.accentCyan
              : AppColors.textMuted;
          return GoogleFonts.jetBrainsMono(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: color,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final color = states.contains(WidgetState.selected)
              ? AppColors.accentCyan
              : AppColors.textMuted;
          return IconThemeData(color: color);
        }),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.accentCyan,
          foregroundColor: AppColors.actionForeground,
          textStyle: GoogleFonts.jetBrainsMono(fontWeight: FontWeight.w700),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.l,
            vertical: AppSpacing.m,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(color: AppColors.borderSubtle),
          textStyle: GoogleFonts.jetBrainsMono(fontWeight: FontWeight.w700),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.l,
            vertical: AppSpacing.m,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.panelBackground,
        hintStyle: textTheme.bodyMedium?.copyWith(color: AppColors.textMuted),
        labelStyle: textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: AppColors.borderSubtle),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: AppColors.borderSubtle),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: AppColors.accentCyan, width: 1.4),
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: AppColors.panelElevated,
        side: const BorderSide(color: AppColors.borderSubtle),
        selectedColor: AppColors.accentPurple.withValues(alpha: 0.22),
        secondarySelectedColor: AppColors.accentPurple.withValues(alpha: 0.22),
        labelStyle: GoogleFonts.jetBrainsMono(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w600,
        ),
        secondaryLabelStyle: GoogleFonts.jetBrainsMono(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.accentCyan;
          }
          return AppColors.panelOverlay;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.accentCyan.withValues(alpha: 0.26);
          }
          return AppColors.panelElevated;
        }),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.panelElevated,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.textPrimary,
        ),
        actionTextColor: AppColors.accentPink,
      ),
      listTileTheme: ListTileThemeData(
        textColor: AppColors.textPrimary,
        iconColor: AppColors.textSecondary,
        tileColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.accentCyan,
        linearTrackColor: AppColors.panelElevated,
      ),
    );
  }
}
