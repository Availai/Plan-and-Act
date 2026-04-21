import 'package:flutter/material.dart';
import 'package:planandact/shared/presentation/widgets/app_backdrop.dart';
import 'package:planandact/shared/presentation/widgets/empty_state_view.dart';

class StuckScreen extends StatelessWidget {
  const StuckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tikaniklik')),
      body: const AppBackdrop(
        child: EmptyStateView(
          title: 'Simdilik temiz',
          message: 'Sistem aktif bir erteleme dongusu tespit etmedi. Takildiginda bu alan stratejik toparlanma onerecek.',
          icon: Icons.psychology_alt_rounded,
        ),
      ),
    );
  }
}
