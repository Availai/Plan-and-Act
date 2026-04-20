import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:planandact/features/plan_management/home_screen.dart';
import 'package:planandact/l10n/app_localizations.dart';

void main() {
  runApp(const PlanAndActApp());
}

class PlanAndActApp extends StatelessWidget {
  const PlanAndActApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      locale: const Locale('tr'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: mediaQuery.textScaler.clamp(
              minScaleFactor: 1,
              maxScaleFactor: 2,
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const HomeScreen(),
    );
  }

  ThemeData _buildLightTheme() {
    const scheme = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF2440D4),
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFDDE2FF),
      onPrimaryContainer: Color(0xFF0A1556),
      secondary: Color(0xFF4A578E),
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFDDE1FF),
      onSecondaryContainer: Color(0xFF111A44),
      tertiary: Color(0xFF5C3780),
      onTertiary: Colors.white,
      tertiaryContainer: Color(0xFFF1DAFF),
      onTertiaryContainer: Color(0xFF300A52),
      error: Color(0xFFBA1A1A),
      onError: Colors.white,
      surface: Color(0xFFF8F9FF),
      onSurface: Color(0xFF111320),
      onSurfaceVariant: Color(0xFF414659),
      surfaceContainer: Color(0xFFE7E8F5),
      surfaceContainerHighest: Color(0xFFDFE2F3),
      outline: Color(0xFF74798D),
      outlineVariant: Color(0xFFC4C6D6),
      shadow: Colors.black,
      scrim: Colors.black,
      inverseSurface: Color(0xFF2E3040),
      onInverseSurface: Color(0xFFF0F0FA),
      inversePrimary: Color(0xFFBAC3FF),
      surfaceTint: Color(0xFF2440D4),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      cardTheme: CardThemeData(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    const scheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFBEC4FF),
      onPrimary: Color(0xFF0C1F84),
      primaryContainer: Color(0xFF2B43B8),
      onPrimaryContainer: Color(0xFFE2E6FF),
      secondary: Color(0xFFC0C6F0),
      onSecondary: Color(0xFF293062),
      secondaryContainer: Color(0xFF3F467A),
      onSecondaryContainer: Color(0xFFE0E3FF),
      tertiary: Color(0xFFE1B7FF),
      onTertiary: Color(0xFF442062),
      tertiaryContainer: Color(0xFF5C377A),
      onTertiaryContainer: Color(0xFFF5DBFF),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      surface: Color(0xFF0B1021),
      onSurface: Color(0xFFE4E6F2),
      onSurfaceVariant: Color(0xFFC4C8DC),
      surfaceContainer: Color(0xFF1B223C),
      surfaceContainerHighest: Color(0xFF283151),
      outline: Color(0xFF8F94AA),
      outlineVariant: Color(0xFF444A61),
      shadow: Colors.black,
      scrim: Colors.black,
      inverseSurface: Color(0xFFE4E6F2),
      onInverseSurface: Color(0xFF2B3042),
      inversePrimary: Color(0xFF314CD8),
      surfaceTint: Color(0xFFBEC4FF),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF1D2235),
        contentTextStyle: const TextStyle(color: Colors.white),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF151B33),
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1A2242),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFBEC4FF), width: 1.8),
        ),
      ),
    );
  }
}
