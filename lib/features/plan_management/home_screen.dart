import 'package:flutter/material.dart';
import 'plan_model.dart';
import 'add_plan_sheet.dart';
import 'package:planandact/core/storage_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Şimdilik test için boş bir liste
  List<PlanModel> myPlans = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _loadSavedPlans();
  }

  Future<void> _loadSavedPlans() async {
    final savedPlans = await StorageService.loadPlans();
    setState(() {
      myPlans = savedPlans;
      isLoading = false; // Yükleme bitti
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plan and Act'), centerTitle: true),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : myPlans.isEmpty
          ? const Center(child: Text('Henüz bir plan yok. Hemen ekle!'))
          : ListView.builder(
              itemCount: myPlans.length,
              itemBuilder: (context, index) {
                final plan = myPlans[index];
                return ListTile(
                  title: Text(plan.title),
                  subtitle: Text(
                    plan.assignedWisdom ?? 'Henüz tavsiye üretilmedi.',
                  ),
                  trailing: Text(
                    '${plan.scheduledTime.hour}:${plan.scheduledTime.minute}',
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // BottomSheet kapanana kadar bekle ve dönen veriyi (newPlan) al
          final result = await showModalBottomSheet<PlanModel>(
            context: context,
            isScrollControlled: true,
            builder: (context) => const AddPlanSheet(),
          );

          // Eğer boş dönmediyse (kullanıcı paneli iptal etmediyse) listeye ekle
          if (result != null) {
            setState(() {
              myPlans.add(result);

              // Liste zamana göre sıralansın (Önce olan plan en üstte)
              myPlans.sort(
                (a, b) => a.scheduledTime.compareTo(b.scheduledTime),
              );
            });
            await StorageService.savePlans(myPlans);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
