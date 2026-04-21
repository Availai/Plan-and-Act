import 'package:drift/drift.dart';
import 'package:planandact/core/errors/failure.dart';
import 'package:planandact/core/logging/logger.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/domain/entities/plan_status_history_entry.dart';
import 'package:planandact/features/planning/domain/repositories/plan_history_repository.dart';
import 'package:planandact/shared/data/local/app_database.dart';

class DriftPlanHistoryRepository implements PlanHistoryRepository {
  const DriftPlanHistoryRepository({required this.db});

  final AppDatabase db;
  static const _tag = 'DriftPlanHistoryRepository';

  @override
  Future<Result<void>> recordStatusChange(PlanStatusHistoryEntry entry) async {
    try {
      await db.into(db.planStatusHistory).insert(
        PlanStatusHistoryCompanion.insert(
          id: entry.id,
          planId: entry.planId,
          userId: entry.userId,
          fromStatus: Value(entry.fromStatus),
          toStatus: entry.toStatus,
          changedAt: entry.changedAt,
        ),
        mode: InsertMode.replace,
      );
      return const Success(null);
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to record plan history', e, st);
      return const Err(StorageFailure('Plan history record failed'));
    }
  }

  @override
  Future<Result<List<PlanStatusHistoryEntry>>> getHistoryForPlan(String planId) async {
    try {
      final rows = await (db.select(db.planStatusHistory)
            ..where((t) => t.planId.equals(planId))
            ..orderBy([(t) => OrderingTerm.desc(t.changedAt)]))
          .get();

      final entries = rows
          .map((row) => PlanStatusHistoryEntry(
                id: row.id,
                planId: row.planId,
                userId: row.userId,
                fromStatus: row.fromStatus,
                toStatus: row.toStatus,
                changedAt: row.changedAt,
              ))
          .toList();

      return Success(entries);
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to fetch plan history', e, st);
      return const Err(StorageFailure('Plan history fetch failed'));
    }
  }
}
