import 'package:flutter/material.dart';
import 'package:planandact/features/plan_management/presentation/screens/home_screen.dart';

class PlanAndActApp extends StatelessWidget {
  const PlanAndActApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF5C6CFF);

    return MaterialApp(
      title: 'Plan and Act',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF0B1021),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: Colors.black.withValues(alpha: 0.85),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF151B33),
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
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
            borderSide: const BorderSide(color: Color(0xFF95A0FF), width: 1.4),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
