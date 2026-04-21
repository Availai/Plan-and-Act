import 'package:flutter/material.dart';
import 'package:planandact/app/theme/app_colors.dart';

class AppBackdrop extends StatelessWidget {
  const AppBackdrop({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.pageBackground,
            AppColors.pageBackgroundDeep,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -110,
            left: -90,
            child: _GlowOrb(
              color: AppColors.accentCyan.withValues(alpha: 0.14),
              size: 250,
            ),
          ),
          Positioned(
            top: 40,
            right: -80,
            child: _GlowOrb(
              color: AppColors.accentPink.withValues(alpha: 0.12),
              size: 220,
            ),
          ),
          Positioned(
            bottom: -130,
            left: 30,
            child: _GlowOrb(
              color: AppColors.accentPurple.withValues(alpha: 0.10),
              size: 260,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({
    required this.color,
    required this.size,
  });

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color,
              color.withValues(alpha: 0),
            ],
          ),
        ),
      ),
    );
  }
}
