import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/application/providers/plan_repository_provider.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';

const _defaultUserId = 'local_user';

/// Provides every active (non-deleted) plan in the database, sorted by
/// scheduled time descending so the newest work surfaces first.
final allPlansProvider = FutureProvider.autoDispose<List<PlanEntity>>((ref) async {
  final repo = ref.watch(planRepositoryProvider);
  final result = await repo.getAllPlans(_defaultUserId);
  switch (result) {
    case Success(:final value):
      final sorted = List<PlanEntity>.from(value);
      sorted.sort((a, b) => b.scheduledAtUtc.compareTo(a.scheduledAtUtc));
      return sorted;
    case Err(:final failure):
      throw Exception(failure.message);
  }
});
