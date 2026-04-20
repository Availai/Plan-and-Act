import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/features/plan_management/data/datasources/plan_storage_service.dart';
import 'package:planandact/features/plan_management/domain/entities/plan.dart';

final plansProvider =
    AsyncNotifierProvider<PlansNotifier, List<Plan>>(PlansNotifier.new);

class PlansNotifier extends AsyncNotifier<List<Plan>> {
  @override
  Future<List<Plan>> build() => _loadSortedPlans();

  Future<void> refreshPlans() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_loadSortedPlans);
  }

  Future<void> addPlan(Plan plan) async {
    final currentPlans = [...(state.valueOrNull ?? await _loadSortedPlans()), plan]
      ..sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));

    state = AsyncData(currentPlans);
    await PlanStorageService.savePlans(currentPlans);
  }

  Future<List<Plan>> _loadSortedPlans() async {
    final plans = await PlanStorageService.loadPlans();
    plans.sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));
    return plans;
  }
}
