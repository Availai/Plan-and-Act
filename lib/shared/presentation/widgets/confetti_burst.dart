import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:planandact/app/theme/app_colors.dart';

/// One-shot particle burst overlay.
///
/// Increment [trigger] to replay. Use inside a [Stack] with [Positioned.fill]
/// and wrap in [IgnorePointer] so it never blocks touches.
class ConfettiBurst extends StatefulWidget {
  const ConfettiBurst({
    super.key,
    required this.trigger,
    this.duration = const Duration(milliseconds: 1800),
    this.particleCount = 60,
  });

  final int trigger;
  final Duration duration;
  final int particleCount;

  @override
  State<ConfettiBurst> createState() => _ConfettiBurstState();
}

class _ConfettiBurstState extends State<ConfettiBurst>
    with SingleTickerProviderStateMixin {
  static const _palette = <Color>[
    AppColors.accentCyan,
    AppColors.accentPink,
    AppColors.accentPurple,
    AppColors.warning,
    AppColors.success,
  ];

  late final AnimationController _controller;
  final _rng = math.Random();
  List<_Particle> _particles = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() => setState(() {}));
  }

  @override
  void didUpdateWidget(covariant ConfettiBurst old) {
    super.didUpdateWidget(old);
    if (widget.trigger != old.trigger && widget.trigger > 0) {
      _spawn();
      _controller.forward(from: 0);
    }
  }

  void _spawn() {
    _particles = List.generate(widget.particleCount, (_) {
      final angle = _rng.nextDouble() * math.pi * 2;
      final speed = 180 + _rng.nextDouble() * 340;
      return _Particle(
        color: _palette[_rng.nextInt(_palette.length)],
        vx: math.cos(angle) * speed,
        vy: math.sin(angle) * speed - 180, // bias upward
        rotation: _rng.nextDouble() * math.pi * 2,
        rotationSpeed: (_rng.nextDouble() - 0.5) * 10,
        size: 6 + _rng.nextDouble() * 6,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value == 0 || _controller.value == 1) {
      return const SizedBox.shrink();
    }
    return CustomPaint(
      size: Size.infinite,
      painter: _ConfettiPainter(
        particles: _particles,
        t: _controller.value,
      ),
    );
  }
}

class _Particle {
  _Particle({
    required this.color,
    required this.vx,
    required this.vy,
    required this.rotation,
    required this.rotationSpeed,
    required this.size,
  });

  final Color color;
  final double vx;
  final double vy;
  final double rotation;
  final double rotationSpeed;
  final double size;
}

class _ConfettiPainter extends CustomPainter {
  _ConfettiPainter({required this.particles, required this.t});

  final List<_Particle> particles;
  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    final origin = Offset(size.width / 2, size.height * 0.55);
    const gravity = 900.0;
    final fade = t < 0.7 ? 1.0 : (1.0 - (t - 0.7) / 0.3);

    for (final p in particles) {
      final x = origin.dx + p.vx * t;
      final y = origin.dy + p.vy * t + 0.5 * gravity * t * t;
      final rot = p.rotation + p.rotationSpeed * t;

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(rot);
      canvas.drawRect(
        Rect.fromCenter(center: Offset.zero, width: p.size, height: p.size * 0.55),
        Paint()..color = p.color.withValues(alpha: fade),
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter old) => old.t != t;
}
