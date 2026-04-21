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
      themeMode: ThemeMode.dark,
      theme: AppTheme.theme,
      darkTheme: AppTheme.theme,
      routerConfig: appRouter,
    );
  }
}
