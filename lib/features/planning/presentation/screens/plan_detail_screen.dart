import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/app/theme/app_spacing.dart';
import 'package:planandact/features/planning/application/providers/use_case_providers.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_status.dart';

class PlanDetailScreen extends ConsumerWidget {
  const PlanDetailScreen({super.key, required this.plan});

  final PlanEntity plan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan Detayı'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded),
            onPressed: () {
              ref.read(deletePlanUseCaseProvider).call(plan.id);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plan.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: AppSpacing.s),
            Row(
              children: [
                _buildChip(context, plan.status.name.toUpperCase(), _getStatusColor(plan.status)),
                const SizedBox(width: AppSpacing.s),
                _buildChip(context, plan.priority.name.toUpperCase(), Colors.amber),
                if (plan.durationMinutes != null) ...[
                  const SizedBox(width: AppSpacing.s),
                  _buildChip(context, '${plan.durationMinutes} dk', Colors.grey),
                ]
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Açıklama',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.textMediumEmphasisLight),
            ),
            const SizedBox(height: AppSpacing.s),
            Text(
              plan.description.isNotEmpty ? plan.description : 'Açıklama veya not eklenmemiş.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: AppSpacing.xl),
            
            // Action Buttons
            if (plan.status == PlanStatus.planned) ...[
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    ref.read(markPlanCompletedUseCaseProvider).call(plan.id);
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.check_circle_rounded),
                  label: const Text('Hedefi Tamamla'),
                ),
              ),
              const SizedBox(height: AppSpacing.m),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // ref.read(postponePlanUseCaseProvider).call(plan.id) vs
                    Navigator.pop(context);
                  },
                  child: const Text('Ertele'),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildChip(BuildContext context, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Color _getStatusColor(PlanStatus status) {
    switch (status) {
      case PlanStatus.completed: return Colors.green;
      case PlanStatus.canceled: return Colors.red;
      case PlanStatus.postponed: return Colors.orange;
      case PlanStatus.planned: return Colors.blue;
      case PlanStatus.skipped: return Colors.grey;
    }
  }
}
