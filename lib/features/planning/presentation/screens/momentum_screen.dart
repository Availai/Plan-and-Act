import 'package:flutter/material.dart';

import 'package:planandact/shared/presentation/widgets/empty_state_view.dart';

class MomentumScreen extends StatelessWidget {
  const MomentumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Momentum')),
      body: const EmptyStateView(
        title: 'Momentumunuz Henüz Hesaplanıyor',
        message: 'Görevleri tamamlamaya devam ettikçe burada serileriniz (streak) ve momentum puanınız belirecek.',
        icon: Icons.local_fire_department_rounded,
      ),
    );
  }
}
