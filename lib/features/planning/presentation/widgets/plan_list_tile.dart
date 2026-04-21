import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/app/theme/app_spacing.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_priority.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_status.dart';

class PlanListTile extends StatefulWidget {
  const PlanListTile({
    super.key,
    required this.plan,
    required this.onToggleComplete,
    required this.onDelete,
    required this.onEdit,
  });

  final PlanEntity plan;
  final ValueChanged<bool> onToggleComplete;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  @override
  State<PlanListTile> createState() => _PlanListTileState();
}

class _PlanListTileState extends State<PlanListTile> {
  bool _expanded = false;

  Color _getPriorityColor() {
    switch (widget.plan.priority) {
      case PlanPriority.high:
      case PlanPriority.critical:
        return AppColors.danger;
      case PlanPriority.medium:
        return AppColors.warning;
      case PlanPriority.low:
        return AppColors.laneColor(widget.plan.categoryId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCompleted = widget.plan.status == PlanStatus.completed;
    final baseOpacity = isCompleted ? 0.42 : 1.0;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.s),
      decoration: BoxDecoration(
        color: AppColors.panelBackground.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.borderSubtle),
        boxShadow: [
          BoxShadow(
            color: AppColors.pageBackground.withValues(alpha: 0.16),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(22),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Slidable(
            key: ValueKey(widget.plan.id),
            startActionPane: ActionPane(
              motion: const BehindMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    HapticFeedback.mediumImpact();
                    widget.onToggleComplete(!isCompleted);
                  },
                  backgroundColor: AppColors.success,
                  foregroundColor: AppColors.actionForeground,
                  icon: isCompleted
                      ? Icons.restart_alt_rounded
                      : Icons.check_circle_rounded,
                  label: isCompleted ? 'Geri Al' : 'Tamamla',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const BehindMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    HapticFeedback.lightImpact();
                    widget.onEdit();
                  },
                  backgroundColor: AppColors.info,
                  foregroundColor: AppColors.actionForeground,
                  icon: Icons.edit_rounded,
                  label: 'Duzenle',
                ),
                SlidableAction(
                  onPressed: (_) {
                    HapticFeedback.heavyImpact();
                    widget.onDelete();
                  },
                  backgroundColor: AppColors.danger,
                  foregroundColor: AppColors.actionForeground,
                  icon: Icons.delete_outline_rounded,
                  label: 'Sil',
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  _expanded = !_expanded;
                });
                HapticFeedback.selectionClick();
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.all(AppSpacing.m),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 38,
                          decoration: BoxDecoration(
                            color: _getPriorityColor().withValues(alpha: baseOpacity),
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.m),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.plan.title,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: AppColors.textPrimary.withValues(alpha: baseOpacity),
                                    ),
                              ),
                              const SizedBox(height: AppSpacing.xxs),
                              Row(
                                children: [
                                  Icon(
                                    Icons.schedule_rounded,
                                    size: 14,
                                    color: AppColors.textMuted.withValues(alpha: baseOpacity),
                                  ),
                                  const SizedBox(width: AppSpacing.xs),
                                  Text(
                                    widget.plan.scheduledTimeLocal.isEmpty
                                        ? 'Saat net degil'
                                        : widget.plan.scheduledTimeLocal,
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          color: AppColors.textSecondary
                                              .withValues(alpha: baseOpacity),
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isCompleted
                                  ? AppColors.success
                                  : AppColors.borderSubtle,
                              width: 2,
                            ),
                            color: isCompleted ? AppColors.success : Colors.transparent,
                          ),
                          child: isCompleted
                              ? const Icon(
                                  Icons.check,
                                  size: 12,
                                  color: AppColors.actionForeground,
                                )
                              : null,
                        ),
                      ],
                    ),
                    AnimatedCrossFade(
                      firstChild: const SizedBox(width: double.infinity, height: 0),
                      secondChild: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top: AppSpacing.m,
                          left: AppSpacing.m,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(height: 1),
                            const SizedBox(height: AppSpacing.s),
                            Text(
                              widget.plan.description.isEmpty
                                  ? 'Aciklama veya ek not yok.'
                                  : widget.plan.description,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textSecondary
                                        .withValues(alpha: baseOpacity),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      crossFadeState: _expanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 220),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
