import 'package:flutter/material.dart';

import 'package:planandact/app/theme/app_spacing.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')),
      body: ListView(
        children: [
          const SizedBox(height: AppSpacing.s),
          ListTile(
            leading: const Icon(Icons.notifications_rounded),
            title: const Text('Bildirimler'),
            subtitle: const Text('Hatırlatıcıları veya sabah motivasyonunu yapılandırın'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.psychology_rounded),
            title: const Text('Bilgelik Motoru Tonu'),
            subtitle: const Text('Şu an: Doğrudan & Disiplin Odaklı'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.palette_rounded),
            title: const Text('Tema'),
            subtitle: const Text('Cihaz sistemini takip eder'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(AppSpacing.l),
            child: Text(
              'Geliştirici Sürümü v1.0.0-beta',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
