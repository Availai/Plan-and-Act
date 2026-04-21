import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/app/theme/app_spacing.dart';
import 'package:planandact/features/planning/presentation/providers/reflection_providers.dart';
import 'package:planandact/features/planning/application/providers/use_case_providers.dart';
import 'package:planandact/features/planning/presentation/widgets/plan_list_tile.dart';
import 'package:planandact/shared/presentation/widgets/empty_state_view.dart';

class ReflectionScreen extends ConsumerWidget {
  const ReflectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedAsync = ref.watch(completedPlansProvider);
    final missedAsync = ref.watch(missedPlansProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yansıma'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Başarılanlar',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: AppSpacing.s),
            completedAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Text('Hata: $e'),
              data: (plans) {
                if (plans.isEmpty) {
                  return const EmptyStateView(
                    title: 'Veri Yok',
                    message: 'Henüz tamamladığınız bir görev bulunmuyor.',
                    icon: Icons.history_rounded,
                  );
                }
                return Column(
                  children: plans.map((p) => PlanListTile(
                    plan: p,
                    onToggleComplete: (_) {},
                    onDelete: () {
                      ref.read(deletePlanUseCaseProvider).call(p.id);
                    },
                    onEdit: () {},
                  )).toList(),
                );
              },
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Kaçırılan / Ertelenenler',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: AppSpacing.s),
            missedAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Text('Hata: $e'),
              data: (plans) {
                if (plans.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(AppSpacing.l),
                      child: Text('Harika! Kaçırılan veya ertelenen bir hedefiniz yok.', textAlign: TextAlign.center),
                    ),
                  );
                }
                return Column(
                  children: plans.map((p) => PlanListTile(
                    plan: p,
                    onToggleComplete: (_) {},
                    onDelete: () {
                      ref.read(deletePlanUseCaseProvider).call(p.id);
                    },
                    onEdit: () {},
                  )).toList(),
                );
              },
            ),
            const SizedBox(height: 100), // Bottom padding
          ],
        ),
      ),
    );
  }
}
