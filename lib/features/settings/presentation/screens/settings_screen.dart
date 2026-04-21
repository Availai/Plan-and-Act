import 'package:flutter/material.dart';

import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/app/theme/app_spacing.dart';
import 'package:planandact/shared/presentation/widgets/app_backdrop.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')),
      body: AppBackdrop(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.m),
          children: [
            _SettingsCard(
              icon: Icons.notifications_active_rounded,
              title: 'Bildirimler',
              subtitle: 'Plan hatirlaticilari ve tetikleme davranislari buradan yonetilecek.',
            ),
            const SizedBox(height: AppSpacing.s),
            _SettingsCard(
              icon: Icons.psychology_rounded,
              title: 'Bilgelik Motoru Tonu',
              subtitle: 'Su an: Direct / Discipline-first',
            ),
            const SizedBox(height: AppSpacing.s),
            _SettingsCard(
              icon: Icons.dark_mode_rounded,
              title: 'Tema',
              subtitle: 'Dracula Neon etkin. Uygulama dark-only v1 calisir.',
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.accentPurple.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: AppColors.accentPurple.withValues(alpha: 0.4)),
                ),
                child: Text(
                  'LOCKED',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.accentPurple,
                      ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.l),
            Text(
              'Build v1.0.0-beta',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.m),
      decoration: BoxDecoration(
        color: AppColors.panelBackground.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.panelElevated,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppColors.accentCyan),
          ),
          const SizedBox(width: AppSpacing.m),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: AppSpacing.xxs),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
