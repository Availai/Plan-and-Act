import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/application/providers/plan_repository_provider.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_status.dart';

/// Provides a list of all plans that are completed.
final completedPlansProvider = FutureProvider.autoDispose<List<PlanEntity>>((ref) async {
  final repo = ref.watch(planRepositoryProvider);
  final result = await repo.getPlansByStatus(PlanStatus.completed);
  switch (result) {
    case Success(:final value):
      // Sort most recently completed first
      final sorted = List<PlanEntity>.from(value);
      sorted.sort((a, b) {
        final aDate = a.completedAt ?? a.updatedAt;
        final bDate = b.completedAt ?? b.updatedAt;
        return bDate.compareTo(aDate);
      });
      return sorted;
    case Err(:final failure):
      throw Exception(failure.message);
  }
});

/// Provides a list of all plans that were cancelled, skipped, or postponed recently.
final missedPlansProvider = FutureProvider.autoDispose<List<PlanEntity>>((ref) async {
  final repo = ref.watch(planRepositoryProvider);
  // Fetch multiple statuses 
  final skippedResult = await repo.getPlansByStatus(PlanStatus.skipped);
  final postponedResult = await repo.getPlansByStatus(PlanStatus.postponed);
  final canceledResult = await repo.getPlansByStatus(PlanStatus.canceled);
  
  final List<PlanEntity> missed = [];
  
  if (skippedResult is Success<List<PlanEntity>>) missed.addAll(skippedResult.value);
  if (postponedResult is Success<List<PlanEntity>>) missed.addAll(postponedResult.value);
  if (canceledResult is Success<List<PlanEntity>>) missed.addAll(canceledResult.value);

  // Sort most recent first
  missed.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  return missed;
});
