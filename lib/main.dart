import 'package:flutter/material.dart';

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
      home: const Scaffold(
        body: Center(child: Text('Plan and Act - Başlıyoruz!')),
      ),
    );
  }
}
