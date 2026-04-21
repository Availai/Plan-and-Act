import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/features/planning/application/providers/database_provider.dart';
import 'package:planandact/features/planning/data/repositories/drift_plan_repository.dart';
import 'package:planandact/features/planning/domain/repositories/plan_repository.dart';
import 'package:planandact/shared/data/local/daos/plans_dao.dart';

/// Provides the [PlanRepository] implementation backed by Drift.
final planRepositoryProvider = Provider<PlanRepository>((ref) {
  final db = ref.watch(databaseProvider);
  final dao = PlansDao(db);
  return DriftPlanRepository(plansDao: dao);
});
