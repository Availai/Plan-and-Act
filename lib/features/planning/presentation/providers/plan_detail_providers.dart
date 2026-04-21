import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/application/providers/plan_repository_provider.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';

final planByIdProvider =
    FutureProvider.autoDispose.family<PlanEntity, String>((ref, planId) async {
  final repository = ref.watch(planRepositoryProvider);
  final result = await repository.getPlanById(planId);

  switch (result) {
    case Success(:final value):
      return value;
    case Err(:final failure):
      throw Exception(failure.message);
  }
});
