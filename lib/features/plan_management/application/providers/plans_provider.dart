import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/features/plan_management/data/datasources/plan_storage_service.dart';
import 'package:planandact/features/plan_management/domain/entities/plan.dart';

final plansProvider = AsyncNotifierProvider<PlansNotifier, List<Plan>>(PlansNotifier.new);

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

  Future<void> markPlanCompleted(String planId) async {
    final items = [...(state.valueOrNull ?? await _loadSortedPlans())];
    final index = items.indexWhere((p) => p.id == planId);
    if (index == -1) return;

    items[index] = items[index].copyWith(
      status: PlanStatus.completed,
      completedAt: DateTime.now(),
    );

    state = AsyncData(items);
    await PlanStorageService.savePlans(items);
  }

  Future<void> postponePlan(String planId) async {
    final items = [...(state.valueOrNull ?? await _loadSortedPlans())];
    final index = items.indexWhere((p) => p.id == planId);
    if (index == -1) return;

    final current = items[index];
    items[index] = current.copyWith(
      status: PlanStatus.postponed,
      postponeCount: current.postponeCount + 1,
      scheduledTime: current.scheduledTime.add(const Duration(days: 1)),
      clearCompletedAt: true,
    );

    state = AsyncData(items..sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime)));
    await PlanStorageService.savePlans(items);
  }

  Future<List<Plan>> _loadSortedPlans() async {
    final plans = await PlanStorageService.loadPlans();
    plans.sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));
    return plans;
  }
}
