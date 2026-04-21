import 'package:flutter/material.dart';
import 'package:planandact/shared/presentation/widgets/app_backdrop.dart';
import 'package:planandact/shared/presentation/widgets/empty_state_view.dart';

class MomentumScreen extends StatelessWidget {
  const MomentumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Momentum')),
      body: const AppBackdrop(
        child: EmptyStateView(
          title: 'Momentum hesaplanmaya hazir',
          message: 'Tamamlanan planlar arttikca seri ve ritim metrikleri burada gorunecek.',
          icon: Icons.local_fire_department_rounded,
        ),
      ),
    );
  }
}
