import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/app/theme/app_spacing.dart';
import 'package:planandact/features/planning/application/providers/use_case_providers.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_priority.dart';
import 'package:uuid/uuid.dart';

class AddPlanSheet extends ConsumerStatefulWidget {
  const AddPlanSheet({super.key});

  static void show(BuildContext context) {

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: const AddPlanSheet(),
      ),
    );
  }

  @override
  ConsumerState<AddPlanSheet> createState() => _AddPlanSheetState();
}

class _AddPlanSheetState extends ConsumerState<AddPlanSheet> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  
  PlanPriority _priority = PlanPriority.medium;
  TimeOfDay? _selectedTime;
  bool _reminderEnabled = true;

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _savePlan() async {
    final title = _titleController.text.trim();
    if (title.isEmpty) return;

    final now = DateTime.now();
    
    // Default to end of day if not set, or the specific time
    var scheduledAtUtc = now.toUtc();
    var scheduledTimeLocal = '';
    
    if (_selectedTime != null) {
      final scheduledDate = DateTime(
        now.year, now.month, now.day,
        _selectedTime!.hour, _selectedTime!.minute,
      );
      scheduledAtUtc = scheduledDate.toUtc();
      scheduledTimeLocal = '${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}';
    }

    final newPlan = PlanEntity(
      id: const Uuid().v4(),
      userId: 'local_user',
      title: title,
      description: _descController.text.trim(),
      scheduledDate: now,
      scheduledTimeLocal: scheduledTimeLocal,
      scheduledAtUtc: scheduledAtUtc,
      priority: _priority,
      reminderEnabled: _reminderEnabled,
      reminderTimeLocal: _reminderEnabled ? scheduledTimeLocal : null,
      reminderAtUtc: _reminderEnabled ? scheduledAtUtc : null,
      createdAt: now,
      updatedAt: now,
    );

    final useCase = ref.read(createPlanUseCaseProvider);
    await useCase.call(newPlan);

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusL)),
        ),
        padding: const EdgeInsets.all(AppSpacing.l),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: AppSpacing.l),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.borderDark : AppColors.borderLight,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            TextField(
              controller: _titleController,
              autofocus: true,
              style: Theme.of(context).textTheme.titleLarge,
              decoration: const InputDecoration(
                hintText: 'Ne yapmak istiyorsun?',
                border: InputBorder.none,
              ),
            ),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(
                hintText: 'Detay veya not (isteğe bağlı)',
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: AppSpacing.m),
            Row(
              children: [
                ActionChip(
                  label: Text(_selectedTime?.format(context) ?? 'Saat Seç'),
                  avatar: const Icon(Icons.schedule_rounded, size: 16),
                  onPressed: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      setState(() => _selectedTime = time);
                    }
                  },
                ),
                const SizedBox(width: AppSpacing.s),
                DropdownButtonHideUnderline(
                  child: DropdownButton<PlanPriority>(
                    value: _priority,
                    style: Theme.of(context).textTheme.bodySmall,
                    items: PlanPriority.values.map((p) {
                      return DropdownMenuItem(
                        value: p,
                        child: Text(p.name.toUpperCase()),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) setState(() => _priority = val);
                    },
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.notifications_rounded, size: 16),
                    Switch(
                      value: _reminderEnabled,
                      onChanged: (val) => setState(() => _reminderEnabled = val),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: AppSpacing.l),
            FilledButton(
              onPressed: _savePlan,
              child: const Text('Oluştur'),
            ),
          ],
        ),
      ),
    );
  }
}
