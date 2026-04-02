import 'package:flutter/material.dart';
import 'package:planandact/features/plan_management/home_screen.dart';

void main() {
  runApp(const PlanAndActApp());
}

class PlanAndActApp extends StatelessWidget {
  const PlanAndActApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plan and Act',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const HomeScreen(), // Ana ekranı buraya bağladık
    );
  }
}
