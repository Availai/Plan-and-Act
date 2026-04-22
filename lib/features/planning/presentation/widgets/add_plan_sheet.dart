import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/app/theme/app_spacing.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/application/providers/use_case_providers.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_lane.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_priority.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_task_type.dart';
import 'package:planandact/shared/presentation/widgets/app_backdrop.dart';
import 'package:uuid/uuid.dart';

class AddPlanSheet extends ConsumerStatefulWidget {
  const AddPlanSheet({
    super.key,
    required this.selectedDate,
    this.initialPlan,
  });

  final DateTime selectedDate;
  final PlanEntity? initialPlan;

  static void show(
    BuildContext context, {
    required DateTime selectedDate,
    PlanEntity? initialPlan,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: AddPlanSheet(
          selectedDate: selectedDate,
          initialPlan: initialPlan,
        ),
      ),
    );
  }

  @override
  ConsumerState<AddPlanSheet> createState() => _AddPlanSheetState();
}

class _AddPlanSheetState extends ConsumerState<AddPlanSheet> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _titleFocus = FocusNode();
  final _descFocus = FocusNode();

  PlanPriority _priority = PlanPriority.medium;
  TimeOfDay? _selectedTime;
  PlanLane _lane = PlanLane.mustDo;
  PlanTaskType _taskType = PlanTaskType.programming;
  bool _reminderEnabled = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialPlan;
    if (initial == null) return;

    _titleController.text = initial.title;
    _descController.text = initial.description;
    _priority = initial.priority;
    _reminderEnabled = initial.reminderEnabled;
    _lane = PlanLane.fromCategoryId(initial.categoryId);

    final snapshot = initial.motivationContextSnapshot ?? '';
    if (snapshot.startsWith('task_type:')) {
      _taskType = parsePlanTaskTypeKey(snapshot.replaceFirst('task_type:', ''));
    }

    if (initial.scheduledTimeLocal.isNotEmpty) {
      final parts = initial.scheduledTimeLocal.split(':');
      if (parts.length == 2) {
        final hour = int.tryParse(parts.first);
        final minute = int.tryParse(parts.last);
        if (hour != null && minute != null) {
          _selectedTime = TimeOfDay(hour: hour, minute: minute);
        }
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _titleFocus.dispose();
    _descFocus.dispose();
    super.dispose();
  }

  Future<void> _savePlan() async {
    if (_isSaving) return;
    final title = _titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lutfen gorev basligi girin.')),
      );
      return;
    }

    final now = DateTime.now();
    final baseDate = DateTime(
      widget.selectedDate.year,
      widget.selectedDate.month,
      widget.selectedDate.day,
    );
    final effectiveTime = _selectedTime ?? const TimeOfDay(hour: 9, minute: 0);
    final scheduledDateTime = DateTime(
      baseDate.year,
      baseDate.month,
      baseDate.day,
      effectiveTime.hour,
      effectiveTime.minute,
    );

    final scheduledAtUtc = scheduledDateTime.toUtc();
    final scheduledTimeLocal =
        '${effectiveTime.hour.toString().padLeft(2, '0')}:${effectiveTime.minute.toString().padLeft(2, '0')}';

    if (_reminderEnabled && _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hatirlatici icin saat secmelisiniz.')),
      );
      return;
    }

    final newPlan = (widget.initialPlan ??
            PlanEntity(
              id: const Uuid().v4(),
              userId: 'local_user',
              title: title,
              description: _descController.text.trim(),
              scheduledDate: baseDate,
              scheduledTimeLocal: scheduledTimeLocal,
              scheduledAtUtc: scheduledAtUtc,
              priority: _priority,
              reminderEnabled: _reminderEnabled,
              reminderTimeLocal: _reminderEnabled ? scheduledTimeLocal : null,
              reminderAtUtc: _reminderEnabled ? scheduledAtUtc : null,
              motivationContextSnapshot: 'task_type:${_taskType.key}',
              createdAt: now,
              updatedAt: now,
            ))
        .copyWith(
          title: title,
          description: _descController.text.trim(),
          scheduledDate: baseDate,
          scheduledTimeLocal: scheduledTimeLocal,
          scheduledAtUtc: scheduledAtUtc,
          categoryId: _lane.id,
          priority: _priority,
          reminderEnabled: _reminderEnabled,
          reminderTimeLocal: _reminderEnabled ? scheduledTimeLocal : null,
          reminderAtUtc: _reminderEnabled ? scheduledAtUtc : null,
          motivationContextSnapshot: 'task_type:${_taskType.key}',
          updatedAt: now,
        );

    final isEditing = widget.initialPlan != null;
    setState(() => _isSaving = true);
    HapticFeedback.lightImpact();
    final result = isEditing
        ? await ref.read(updatePlanUseCaseProvider).call(newPlan)
        : await ref.read(createPlanUseCaseProvider).call(newPlan);

    if (!mounted) return;
    setState(() => _isSaving = false);

    switch (result) {
      case Success<PlanEntity>():
        HapticFeedback.mediumImpact();
        Navigator.of(context).pop();
      case Err<PlanEntity>(:final failure):
        HapticFeedback.heavyImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.message)),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(bottom: media.viewInsets.bottom),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(AppSpacing.radiusL),
          ),
          child: AppBackdrop(
            child: Container(
              constraints: BoxConstraints(maxHeight: media.size.height * 0.92),
              decoration: BoxDecoration(
                color: AppColors.panelBackground.withValues(alpha: 0.92),
                border: Border.all(color: AppColors.borderSubtle),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 16,
                    offset: const Offset(0, -6),
                  ),
                ],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppSpacing.radiusL),
                ),
              ),
              padding: const EdgeInsets.all(AppSpacing.l),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Container(
                        width: 56,
                        height: 5,
                        margin: const EdgeInsets.only(bottom: AppSpacing.l),
                        decoration: BoxDecoration(
                          color: AppColors.borderSubtle,
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                    ),
                    Text(
                      widget.initialPlan == null ? 'Yeni Plan' : 'Plani Guncelle',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpacing.m),
                    AnimatedBuilder(
                      animation: _titleFocus,
                      builder: (context, child) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: _titleFocus.hasFocus
                                ? [
                                    BoxShadow(
                                      color: AppColors.accentCyan.withValues(alpha: 0.15),
                                      blurRadius: 12,
                                      spreadRadius: 2,
                                    )
                                  ]
                                : [],
                          ),
                          child: child,
                        );
                      },
                      child: TextField(
                        controller: _titleController,
                        focusNode: _titleFocus,
                        autofocus: true,
                        style: Theme.of(context).textTheme.titleMedium,
                        decoration: const InputDecoration(
                          labelText: 'Baslik',
                          hintText: 'Ne yapacaksin?',
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s),
                    AnimatedBuilder(
                      animation: _descFocus,
                      builder: (context, child) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: _descFocus.hasFocus
                                ? [
                                    BoxShadow(
                                      color: AppColors.accentCyan.withValues(alpha: 0.15),
                                      blurRadius: 12,
                                      spreadRadius: 2,
                                    )
                                  ]
                                : [],
                          ),
                          child: child,
                        );
                      },
                      child: TextField(
                        controller: _descController,
                        focusNode: _descFocus,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Detay',
                          hintText: 'Not, baglam veya beklenen sonuc',
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.m),
                    Text(
                      'Gorev Turu',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: AppSpacing.s),
                    Wrap(
                      spacing: AppSpacing.s,
                      runSpacing: AppSpacing.s,
                      children: PlanTaskType.values.map((type) {
                        final selected = _taskType == type;
                        return ChoiceChip(
                          label: Text(type.label),
                          selected: selected,
                          backgroundColor: Colors.transparent,
                          selectedColor: Colors.transparent,
                          side: BorderSide(
                            color: selected ? AppColors.accentCyan : AppColors.borderSubtle,
                            width: selected ? 1.5 : 1,
                          ),
                          onSelected: (_) {
                            HapticFeedback.lightImpact();
                            setState(() => _taskType = type);
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: AppSpacing.m),
                    Text(
                      'Plan Lane',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: AppSpacing.s),
                    Wrap(
                      spacing: AppSpacing.s,
                      runSpacing: AppSpacing.s,
                      children: PlanLane.values.map((lane) {
                        final selected = _lane == lane;
                        return ChoiceChip(
                          label: Text(lane.labelTr),
                          selected: selected,
                          backgroundColor: Colors.transparent,
                          selectedColor: Colors.transparent,
                          side: BorderSide(
                            color: selected ? AppColors.laneColor(lane.id) : AppColors.borderSubtle,
                            width: selected ? 1.5 : 1,
                          ),
                          onSelected: (_) {
                            HapticFeedback.lightImpact();
                            setState(() => _lane = lane);
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: AppSpacing.m),
                    Row(
                      children: [
                        Expanded(
                          child: ActionChip(
                            label: Text(
                              _selectedTime?.format(context) ?? 'Saat Sec',
                              style: const TextStyle(fontFamily: 'JetBrains Mono'),
                            ),
                            avatar: const Icon(Icons.schedule_rounded, size: 16),
                            onPressed: () async {
                              HapticFeedback.lightImpact();
                              final time = await showTimePicker(
                                context: context,
                                initialTime: _selectedTime ?? TimeOfDay.now(),
                              );
                              if (time != null) {
                                setState(() => _selectedTime = time);
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: AppSpacing.s),
                        Expanded(
                          child: DropdownButtonFormField<PlanPriority>(
                            value: _priority,
                            decoration: const InputDecoration(labelText: 'Oncelik'),
                            items: PlanPriority.values.map((priority) {
                              return DropdownMenuItem(
                                value: priority,
                                child: Text(priority.name.toUpperCase()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              if (value != null) {
                                HapticFeedback.selectionClick();
                                setState(() => _priority = value);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.m),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.m,
                        vertical: AppSpacing.s,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.panelElevated.withValues(alpha: 0.54),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppColors.borderSubtle),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.notifications_active_rounded),
                          const SizedBox(width: AppSpacing.s),
                          Expanded(
                            child: Text(
                              'Hatirlatici aktif',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Switch(
                            value: _reminderEnabled,
                            onChanged: (value) {
                              HapticFeedback.lightImpact();
                              setState(() => _reminderEnabled = value);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.l),
                    FilledButton(
                      onPressed: _isSaving ? null : _savePlan,
                      child: _isSaving
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(widget.initialPlan == null ? 'Olustur' : 'Kaydet'),
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
