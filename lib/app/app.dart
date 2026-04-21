import 'package:flutter/material.dart';
import 'package:planandact/app/router/app_router.dart';
import 'package:planandact/app/theme/app_theme.dart';

class PlanAndActApp extends StatelessWidget {
  const PlanAndActApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Plan and Act',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: appRouter,
    );
  }
}
