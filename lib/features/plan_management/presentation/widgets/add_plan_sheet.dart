import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/features/plan_management/application/providers/add_plan_form_provider.dart';
import 'package:planandact/features/plan_management/application/providers/plans_provider.dart';
import 'package:planandact/features/plan_management/domain/entities/plan.dart';
import 'package:planandact/features/wisdom_engine/wisdom_service.dart';

class AddPlanSheet extends ConsumerWidget {
  const AddPlanSheet({super.key});

  Future<void> _pickTime(BuildContext context, WidgetRef ref) async {
    final selectedTime = ref.read(addPlanFormProvider).selectedTime;
    final time = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
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
      ref.read(addPlanFormProvider.notifier).setTime(time);
    }
  }

  Future<void> _savePlan(BuildContext context, WidgetRef ref) async {
    final formState = ref.read(addPlanFormProvider);

    if (!formState.canSave) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen başlık ve saat girin.')),
      );
      return;
    }

    final now = DateTime.now();
    final selectedTime = formState.selectedTime!;
    final scheduledDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    final title = formState.title.trim();
    final description = formState.description.trim();
    final generatedWisdom = WisdomService.generateWisdom(title, description);

    final newPlan = Plan(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      scheduledTime: scheduledDateTime,
      assignedWisdom: generatedWisdom,
    );

    await ref.read(plansProvider.notifier).addPlan(newPlan);

    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final colorScheme = Theme.of(context).colorScheme;
    final formState = ref.watch(addPlanFormProvider);

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0E142B),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 16, 20, bottomInset + 24),
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
                const Expanded(
                  child: Text(
                    'Yeni Plan Oluştur',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Hedefini yaz, saatini belirle ve motivasyon mesajını kap.',
              style: TextStyle(color: colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: formState.title,
              textInputAction: TextInputAction.next,
              onChanged: ref.read(addPlanFormProvider.notifier).setTitle,
              decoration: const InputDecoration(
                labelText: 'Plan başlığı',
                hintText: 'Örn: Sabah yürüyüşü',
                prefixIcon: Icon(Icons.flag_rounded),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: formState.description,
              maxLines: 3,
              onChanged: ref.read(addPlanFormProvider.notifier).setDescription,
              decoration: const InputDecoration(
                labelText: 'Detaylar (opsiyonel)',
                hintText: 'Örn: 30 dakika tempolu yürüyüş',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.notes_rounded),
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () => _pickTime(context, ref),
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
                        formState.selectedTime == null
                            ? 'Saat seç (zorunlu)'
                            : 'Seçilen saat: ${formState.selectedTime!.format(context)}',
                      ),
                    ),
                    const Icon(Icons.chevron_right_rounded),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => _savePlan(context, ref),
                icon: const Icon(Icons.check_circle_rounded),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('Planı Kaydet', style: TextStyle(fontWeight: FontWeight.w700)),
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
  }
}
