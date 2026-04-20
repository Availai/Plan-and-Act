import 'package:flutter/material.dart';
import 'package:planandact/features/plan_management/presentation/screens/home_screen.dart';

class PlanAndActApp extends StatelessWidget {
  const PlanAndActApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF7B61FF);

    return MaterialApp(
      title: 'Plan and Act',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.dark),
        scaffoldBackgroundColor: const Color(0xFF070B1A),
        cardTheme: CardThemeData(
          margin: EdgeInsets.zero,
          color: const Color(0xFF121A33),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: const Color(0xFF0C1328),
          indicatorColor: const Color(0xFF7B61FF).withValues(alpha: 0.24),
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
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
