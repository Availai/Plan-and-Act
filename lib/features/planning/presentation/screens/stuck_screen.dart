import 'package:flutter/material.dart';
import 'package:planandact/shared/presentation/widgets/empty_state_view.dart';

class StuckScreen extends StatelessWidget {
  const StuckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tıkanıklıktan Kurtul')),
      body: const EmptyStateView(
        title: 'Şu an iyisiniz!',
        message: 'Sistem son zamanlarda büyük bir erteleme veya iptal döngüsü (Tıkanıklık) tespit etmedi.\nEğer takılırsanız, Bilgelik Motoru buradan size stratejik tavsiyeler verecek.',
        icon: Icons.psychology_rounded,
      ),
    );
  }
}
