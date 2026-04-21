import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/app/theme/app_spacing.dart';
import 'package:planandact/features/planning/presentation/providers/plan_detail_providers.dart';
import 'package:planandact/features/planning/presentation/screens/plan_detail_screen.dart';
import 'package:planandact/shared/presentation/widgets/app_backdrop.dart';

class PlanDetailRouteScreen extends ConsumerWidget {
  const PlanDetailRouteScreen({
    super.key,
    required this.planId,
  });

  final String planId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planAsync = ref.watch(planByIdProvider(planId));

    return planAsync.when(
      loading: () => const Scaffold(
        body: AppBackdrop(
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (error, stackTrace) => Scaffold(
        body: AppBackdrop(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.l),
              child: Text(
                'Plan yuklenemedi: $error',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      data: (plan) => PlanDetailScreen(plan: plan),
    );
  }
}
