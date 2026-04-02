import 'package:flutter/material.dart';
import 'plan_model.dart';
import 'package:planandact/features/wisdom_engine/wisdom_service.dart';

class AddPlanSheet extends StatefulWidget {
  const AddPlanSheet({super.key});

  @override
  State<AddPlanSheet> createState() => _AddPlanSheetState();
}

class _AddPlanSheetState extends State<AddPlanSheet> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  TimeOfDay? _selectedTime; // Saat tutacağımız yeni değişken

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
        bottom: bottomInset + 16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Yeni Plan Ekle',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Plan Başlığı (Örn: Spora git)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _descController,
            decoration: const InputDecoration(
              labelText: 'Detaylar (İsteğe bağlı)',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 12),

          // --- YENİ EKLENEN SAAT SEÇİCİ BÖLÜMÜ ---
          ListTile(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            title: Text(
              _selectedTime == null
                  ? 'Saat Seç (Zorunlu)'
                  : 'Seçilen Saat: ${_selectedTime!.format(context)}',
            ),
            trailing: const Icon(Icons.access_time),
            onTap: () async {
              final TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time != null) {
                setState(() {
                  _selectedTime = time;
                });
              }
            },
          ),

          // ----------------------------------------
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_titleController.text.isEmpty || _selectedTime == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Lütfen başlık ve saat girin!'),
                    ),
                  );
                  return;
                }

                // 1. TimeOfDay'i DateTime'a çeviriyoruz (Bugünün tarihi + seçilen saat)
                final now = DateTime.now();
                final scheduledDateTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  _selectedTime!.hour,
                  _selectedTime!.minute,
                );
                final generatedWisdom = WisdomService.generateWisdom(
                  _titleController.text,
                  _descController.text,
                );

                // 2. Yeni bir PlanModel objesi oluşturuyoruz
                final newPlan = PlanModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: _titleController.text,
                  description: _descController.text,
                  scheduledTime: scheduledDateTime,
                  assignedWisdom: generatedWisdom, // EKLENDİ
                );

                // 3. Paneli kapatırken objeyi de geriye fırlatıyoruz
                Navigator.pop(context, newPlan);
              },
              child: const Text('Planı Kaydet'),
            ),
          ),
        ],
      ),
    );
  }
}
