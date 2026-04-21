import 'package:drift/drift.dart';
import 'package:planandact/shared/data/local/app_database.dart';
import 'package:planandact/shared/data/local/tables/plan_status_history_table.dart';
import 'package:planandact/shared/data/local/tables/plans_table.dart';

part 'plans_dao.g.dart';

/// Data access object for plan CRUD and query operations.
@DriftAccessor(tables: [Plans, PlanStatusHistory])
class PlansDao extends DatabaseAccessor<AppDatabase> with _$PlansDaoMixin {
  PlansDao(super.db);

  /// Returns all plans for a given user, sorted by scheduled time.
  Future<List<Plan>> getAllPlans(String userId) {
    return (select(plans)
          ..where((p) => p.userId.equals(userId))
          ..orderBy([(p) => OrderingTerm.asc(p.scheduledAtUtc)]))
        .get();
  }

  Future<Plan?> getPlanById(String planId) {
    return (select(plans)
          ..where((p) => p.id.equals(planId) & p.deletedAt.isNull()))
        .getSingleOrNull();
  }

  /// Returns plans for a specific date.
  Future<List<Plan>> getPlansForDate(String userId, DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(plans)
          ..where((p) =>
              p.userId.equals(userId) &
              p.scheduledDate.isBiggerOrEqualValue(startOfDay) &
              p.scheduledDate.isSmallerThanValue(endOfDay) &
              p.deletedAt.isNull())
          ..orderBy([(p) => OrderingTerm.asc(p.scheduledAtUtc)]))
        .get();
  }

  /// Returns plans that have been postponed 2+ times (stuck detection).
  Future<List<Plan>> getStuckPlans(String userId) {
    return (select(plans)
          ..where((p) =>
              p.userId.equals(userId) &
              p.postponedCount.isBiggerOrEqualValue(2) &
              p.deletedAt.isNull())
          ..orderBy([(p) => OrderingTerm.desc(p.postponedCount)]))
        .get();
  }

  Future<List<Plan>> getPlansByStatus(String status) {
    return (select(plans)
          ..where((p) => p.status.equals(status) & p.deletedAt.isNull())
          ..orderBy([(p) => OrderingTerm.desc(p.updatedAt)]))
        .get();
  }

  /// Inserts a new plan.
  Future<int> insertPlan(PlansCompanion plan) {
    return into(plans).insert(plan);
  }

  /// Updates an existing plan.
  Future<bool> updatePlan(PlansCompanion plan) {
    return update(plans).replace(plan);
  }

  /// Soft-deletes a plan.
  Future<int> softDeletePlan(String planId, DateTime now) {
    return (update(plans)..where((p) => p.id.equals(planId)))
        .write(PlansCompanion(deletedAt: Value(now), updatedAt: Value(now)));
  }

  /// Inserts a status history entry (append-only).
  Future<int> insertStatusHistory(PlanStatusHistoryCompanion entry) {
    return into(planStatusHistory).insert(entry);
  }

  /// Returns status history for a plan.
  Future<List<PlanStatusHistoryData>> getStatusHistory(String planId) {
    return (select(planStatusHistory)
          ..where((h) => h.planId.equals(planId))
          ..orderBy([(h) => OrderingTerm.desc(h.changedAt)]))
        .get();
  }

  /// Watches all plans for a user (reactive stream).
  Stream<List<Plan>> watchPlansForDate(String userId, DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(plans)
          ..where((p) =>
              p.userId.equals(userId) &
              p.scheduledDate.isBiggerOrEqualValue(startOfDay) &
              p.scheduledDate.isSmallerThanValue(endOfDay) &
              p.deletedAt.isNull())
          ..orderBy([(p) => OrderingTerm.asc(p.scheduledAtUtc)]))
        .watch();
  }

  /// Counts completed plans within a date range for streak calculation.
  Future<int> countCompletedInRange(
    String userId,
    DateTime start,
    DateTime end,
  ) async {
    final query = selectOnly(plans)
      ..addColumns([plans.id.count()])
      ..where(plans.userId.equals(userId) &
          plans.status.equals('completed') &
          plans.completedAt.isBiggerOrEqualValue(start) &
          plans.completedAt.isSmallerThanValue(end));

    final result = await query.getSingle();
    return result.read(plans.id.count()) ?? 0;
  }
}
