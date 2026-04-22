import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/application/providers/plan_repository_provider.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/shared/presentation/widgets/app_backdrop.dart';
import 'package:planandact/shared/presentation/widgets/confetti_burst.dart';

/// "Odak Seansi" — Pomodoro-style focus timer bound to a plan.
///
/// 25 minutes deep work, 5 minutes breathing break, auto-cycling.
/// Circular countdown with pulsing nefes halkasi (breath ring).
class FocusScreen extends ConsumerStatefulWidget {
  const FocusScreen({super.key, required this.planId});
  final String planId;

  @override
  ConsumerState<FocusScreen> createState() => _FocusScreenState();
}

enum _Phase { work, breathe }

class _FocusScreenState extends ConsumerState<FocusScreen>
    with SingleTickerProviderStateMixin {
  static const _workDuration = Duration(minutes: 25);
  static const _breakDuration = Duration(minutes: 5);

  late final AnimationController _breath;
  Timer? _ticker;
  Duration _remaining = _workDuration;
  _Phase _phase = _Phase.work;
  bool _running = false;
  int _completedSessions = 0;
  int _celebrationTick = 0;

  PlanEntity? _plan;
  String? _loadError;

  @override
  void initState() {
    super.initState();
    _breath = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    _loadPlan();
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _breath.dispose();
    super.dispose();
  }

  Future<void> _loadPlan() async {
    final repo = ref.read(planRepositoryProvider);
    final result = await repo.getPlanById(widget.planId);
    if (!mounted) return;
    switch (result) {
      case Success(:final value):
        setState(() => _plan = value);
      case Err(:final failure):
        setState(() => _loadError = failure.toString());
    }
  }

  Duration get _phaseTotal =>
      _phase == _Phase.work ? _workDuration : _breakDuration;

  void _toggle() {
    if (_running) {
      _ticker?.cancel();
      setState(() => _running = false);
      HapticFeedback.selectionClick();
    } else {
      HapticFeedback.mediumImpact();
      setState(() => _running = true);
      _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
        if (!mounted) return;
        setState(() {
          if (_remaining.inSeconds <= 1) {
            _advancePhase();
          } else {
            _remaining -= const Duration(seconds: 1);
          }
        });
      });
    }
  }

  void _advancePhase() {
    HapticFeedback.heavyImpact();
    if (_phase == _Phase.work) {
      _completedSessions += 1;
      _celebrationTick += 1;
      _phase = _Phase.breathe;
      _remaining = _breakDuration;
    } else {
      _phase = _Phase.work;
      _remaining = _workDuration;
    }
  }

  void _reset() {
    _ticker?.cancel();
    setState(() {
      _running = false;
      _phase = _Phase.work;
      _remaining = _workDuration;
    });
  }

  String _formatDuration(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final isWork = _phase == _Phase.work;
    final phaseColor = isWork ? AppColors.accentCyan : AppColors.accentPink;
    final progress = 1 - (_remaining.inSeconds / _phaseTotal.inSeconds);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Odak Seansi'),
        actions: [
          IconButton(
            tooltip: 'Sifirla',
            icon: const Icon(Icons.restart_alt_rounded),
            onPressed: _reset,
          ),
        ],
      ),
      body: AppBackdrop(
        child: Stack(
          children: [
            Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _PhaseBadge(
                  label: isWork ? 'ODAK' : 'NEFES',
                  color: phaseColor,
                ),
                const SizedBox(height: 20),
                _buildPlanTitle(),
                const SizedBox(height: 32),
                AnimatedBuilder(
                  animation: _breath,
                  builder: (context, _) {
                    final breath = 0.94 + 0.06 * _breath.value;
                    return Transform.scale(
                      scale: _running ? breath : 1.0,
                      child: SizedBox(
                        width: 260,
                        height: 260,
                        child: CustomPaint(
                          painter: _RingPainter(
                            progress: progress.clamp(0.0, 1.0),
                            color: phaseColor,
                            glow: _running ? _breath.value : 0.0,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _formatDuration(_remaining),
                                  style: TextStyle(
                                    color: phaseColor,
                                    fontSize: 56,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.5,
                                    fontFeatures: const [
                                      FontFeature.tabularFigures()
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  isWork
                                      ? 'derin calisma'
                                      : 'yavas nefes al',
                                  style: const TextStyle(
                                    color: AppColors.textMuted,
                                    fontSize: 13,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 36),
                _buildControls(phaseColor),
                const SizedBox(height: 18),
                if (_completedSessions > 0)
                  Text(
                    'Bugun tamamlanan seans: $_completedSessions',
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 12,
                      letterSpacing: 0.5,
                    ),
                  ),
              ],
            ),
          ),
        ),
            Positioned.fill(
              child: IgnorePointer(
                child: ConfettiBurst(trigger: _celebrationTick),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanTitle() {
    if (_loadError != null) {
      return Text('Plan yuklenemedi',
          style: TextStyle(color: AppColors.danger));
    }
    final title = _plan?.title ?? '...';
    return Text(
      title,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        height: 1.25,
      ),
    );
  }

  Widget _buildControls(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FilledButton.icon(
          onPressed: _toggle,
          icon: Icon(_running ? Icons.pause_rounded : Icons.play_arrow_rounded),
          label: Text(_running ? 'Duraklat' : 'Baslat'),
          style: FilledButton.styleFrom(
            backgroundColor: color,
            foregroundColor: AppColors.pageBackground,
            padding:
                const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          ),
        ),
      ],
    );
  }
}

class _PhaseBadge extends StatelessWidget {
  const _PhaseBadge({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 2,
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({
    required this.progress,
    required this.color,
    required this.glow,
  });

  final double progress;
  final Color color;
  final double glow;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2 - 12;

    // Outer glow ring
    canvas.drawCircle(
      center,
      radius + 6,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8 + 6 * glow)
        ..color = color.withValues(alpha: 0.4 + 0.3 * glow),
    );

    // Track
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10
        ..color = AppColors.panelElevated.withValues(alpha: 0.7),
    );

    // Progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10
        ..strokeCap = StrokeCap.round
        ..shader = SweepGradient(
          colors: [color.withValues(alpha: 0.4), color],
          startAngle: -math.pi / 2,
          endAngle: 3 * math.pi / 2,
        ).createShader(Rect.fromCircle(center: center, radius: radius)),
    );

    // Head dot at current progress
    if (progress > 0) {
      final angle = -math.pi / 2 + 2 * math.pi * progress;
      final dotCenter = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      canvas.drawCircle(
        dotCenter,
        6,
        Paint()..color = color,
      );
      canvas.drawCircle(
        dotCenter,
        10,
        Paint()
          ..color = color.withValues(alpha: 0.3)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _RingPainter old) =>
      old.progress != progress || old.glow != glow || old.color != color;
}
