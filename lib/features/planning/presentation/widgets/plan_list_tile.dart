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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final laneColor = AppColors.laneColor(widget.plan.categoryId, isDark: isDark);
    switch (widget.plan.priority) {
      case PlanPriority.high:
      case PlanPriority.critical:
        return laneColor;
      case PlanPriority.medium:
        return laneColor;
      case PlanPriority.low:
        return laneColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCompleted = widget.plan.status == PlanStatus.completed;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final baseOpacity = isCompleted ? 0.3 : 1.0;
    
    final tileColor = isDark ? AppColors.surfaceDark : AppColors.surfaceLight;
    final borderColor = isDark ? Colors.white10 : AppColors.borderLight;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.s),
      decoration: BoxDecoration(
        color: tileColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
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
                  backgroundColor: AppColors.accentGreen,
                  foregroundColor: Colors.white,
                  icon: isCompleted ? Icons.restart_alt_rounded : Icons.check_circle_rounded,
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
                  backgroundColor: AppColors.accentBlue,
                  foregroundColor: Colors.white,
                  icon: Icons.edit_rounded,
                  label: 'Düzenle',
                ),
                SlidableAction(
                  onPressed: (_) {
                    HapticFeedback.heavyImpact();
                    widget.onDelete();
                  },
                  backgroundColor: AppColors.accentRed,
                  foregroundColor: Colors.white,
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
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.all(AppSpacing.m),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Priority Indicator line
                        Container(
                          width: 3,
                          height: 24,
                          decoration: BoxDecoration(
                            color: _getPriorityColor().withValues(alpha: baseOpacity),
                            borderRadius: BorderRadius.circular(1.5),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.m),
                        
                        // Main Title & Time
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.plan.title,
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: isDark 
                                          ? AppColors.textHighEmphasisDark.withValues(alpha: baseOpacity) 
                                          : AppColors.textHighEmphasisLight.withValues(alpha: baseOpacity),
                                    ),
                              ),
                              if (widget.plan.scheduledTimeLocal.isNotEmpty) ...[
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.schedule_rounded,
                                      size: 14,
                                      color: isDark 
                                          ? AppColors.textMediumEmphasisDark.withValues(alpha: baseOpacity)
                                          : AppColors.textMediumEmphasisLight.withValues(alpha: baseOpacity),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      widget.plan.scheduledTimeLocal,
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            color: isDark 
                                                ? AppColors.textMediumEmphasisDark.withValues(alpha: baseOpacity)
                                                : AppColors.textMediumEmphasisLight.withValues(alpha: baseOpacity),
                                          ),
                                    ),
                                  ],
                                ),
                              ]
                            ],
                          ),
                        ),
                        
                        // Unobtrusive completion dot
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isCompleted ? AppColors.accentGreen : (isDark ? AppColors.borderDark : AppColors.borderLight),
                              width: 2,
                            ),
                            color: isCompleted ? AppColors.accentGreen : Colors.transparent,
                          ),
                          child: isCompleted
                              ? const Icon(Icons.check, size: 12, color: Colors.white)
                              : null,
                        )
                      ],
                    ),
                    
                    // Accordion Expandable Details
                    AnimatedCrossFade(
                      firstChild: const SizedBox(width: double.infinity, height: 0),
                      secondChild: Container(
                        padding: const EdgeInsets.only(top: AppSpacing.m, left: AppSpacing.m + 3),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(height: 1),
                            const SizedBox(height: AppSpacing.s),
                            Text(
                              widget.plan.description.isNotEmpty 
                                  ? widget.plan.description 
                                  : 'Açıklama veya ek not yok.',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: (isDark ? AppColors.textMediumEmphasisDark : AppColors.textMediumEmphasisLight).withValues(alpha: baseOpacity)
                              ),
                            ),
                          ],
                        ),
                      ),
                      crossFadeState: _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 300),
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
