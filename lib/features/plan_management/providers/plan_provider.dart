import 'package:flutter/foundation.dart';
import 'package:planandact/features/plan_management/domain/plan_repository.dart';
import 'package:planandact/features/plan_management/plan_model.dart';

class PlanProvider extends ChangeNotifier {
  PlanProvider({required PlanRepository repository}) : _repository = repository;

  final PlanRepository _repository;

  List<PlanModel> _plans = [];
  bool _isLoading = true;

  List<PlanModel> get plans => List.unmodifiable(_plans);
  bool get isLoading => _isLoading;

  Future<void> loadPlans() async {
    _isLoading = true;
    notifyListeners();

    _plans = await _repository.fetchPlans();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addPlan(PlanModel plan) async {
    _plans = [..._plans, plan]
      ..sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));
    notifyListeners();

    await _repository.savePlans(_plans);
  }
}
