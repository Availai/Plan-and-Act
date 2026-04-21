import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_status.dart';

/// Repository contract for plan CRUD operations.
///
/// Implementation is in the data layer (Drift-backed).
abstract class PlanRepository {
  /// Creates a new plan and returns it.
  Future<Result<PlanEntity>> createPlan(PlanEntity plan);

  /// Updates an existing plan.
  Future<Result<PlanEntity>> updatePlan(PlanEntity plan);

  /// Soft-deletes a plan by ID.
  Future<Result<void>> deletePlan(String planId);

  /// Returns a plan by ID, or NotFoundFailure.
  Future<Result<PlanEntity>> getPlanById(String planId);

  /// Returns all plans for a user on a given date.
  Future<Result<List<PlanEntity>>> getPlansForDate(String userId, DateTime date);

  /// Returns all plans that are stuck (postponed 2+ times).
  Future<Result<List<PlanEntity>>> getStuckPlans(String userId);

  /// Returns all plans matching a specific status.
  Future<Result<List<PlanEntity>>> getPlansByStatus(PlanStatus status);

  /// Reactive stream of plans for a date.
  Stream<List<PlanEntity>> watchPlansForDate(String userId, DateTime date);

  /// Counts completed plans in a date range (for streak calculation).
  Future<int> countCompletedInRange(String userId, DateTime start, DateTime end);
}
