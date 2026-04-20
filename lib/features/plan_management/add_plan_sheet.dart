import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planandact/features/wisdom_engine/wisdom_service.dart';
import 'package:planandact/l10n/app_localizations.dart';

import 'plan_model.dart';

class AddPlanSheet extends StatefulWidget {
  const AddPlanSheet({super.key});

  @override
  State<AddPlanSheet> createState() => _AddPlanSheetState();
}

class _AddPlanSheetState extends State<AddPlanSheet> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  TimeOfDay? _selectedTime;

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF7A86FF),
            ),
          ),
          child: child!,
        );
      },
    );

    if (time != null) {
      setState(() => _selectedTime = time);
    }
  }

  void _savePlan() {
    final l10n = AppLocalizations.of(context);
    if (_titleController.text.trim().isEmpty || _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.validationTitleTime)),
      );
      return;
    }

    final now = DateTime.now();
    final scheduledDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    final title = _titleController.text.trim();
    final description = _descController.text.trim();
    final generatedWisdom = WisdomService.generateWisdom(title, description, l10n);

    final newPlan = PlanModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      scheduledTime: scheduledDateTime,
      assignedWisdom: generatedWisdom,
    );

    Navigator.pop(context, newPlan);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final colorScheme = Theme.of(context).colorScheme;
    final locale = Localizations.localeOf(context).toLanguageTag();

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 360;
        final horizontalPadding = compact ? 16.0 : 20.0;

        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0E142B),
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(horizontalPadding, 16, horizontalPadding, bottomInset + 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 44,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6677FF), Color(0xFFAD65FF)],
                        ),
                      ),
                      child: const Icon(Icons.add_task_rounded, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        l10n.sheetTitle,
                        style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.sheetSubtitle,
                  style: TextStyle(color: colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _titleController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: l10n.planTitleLabel,
                    hintText: l10n.planTitleHint,
                    prefixIcon: const Icon(Icons.flag_rounded),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _descController,
                  maxLines: compact ? 2 : 3,
                  decoration: InputDecoration(
                    labelText: l10n.planDetailsLabel,
                    hintText: l10n.planDetailsHint,
                    alignLabelWithHint: true,
                    prefixIcon: const Icon(Icons.notes_rounded),
                  ),
                ),
                const SizedBox(height: 12),
                Semantics(
                  button: true,
                  label: l10n.timePickerSemantics,
                  hint: l10n.timePickerHint,
                  child: InkWell(
                    onTap: _pickTime,
                    borderRadius: BorderRadius.circular(16),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFF1A2242),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.access_time_rounded),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              _selectedTime == null
                                  ? l10n.pickTimeRequired
                                  : l10n.selectedTime(
                                      DateFormat.Hm(locale).format(
                                        DateTime(
                                          2026,
                                          1,
                                          1,
                                          _selectedTime!.hour,
                                          _selectedTime!.minute,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          const Icon(Icons.chevron_right_rounded),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: _savePlan,
                    icon: const Icon(Icons.check_circle_rounded),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(l10n.savePlan, style: const TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF7582FF),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
