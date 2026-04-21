import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/domain/entities/plan_status_history_entry.dart';

/// Repository contract for plan status transition history.
abstract class PlanHistoryRepository {
  /// Records a status transition (append-only).
  Future<Result<void>> recordStatusChange(PlanStatusHistoryEntry entry);

  /// Returns all status history for a plan.
  Future<Result<List<PlanStatusHistoryEntry>>> getHistoryForPlan(String planId);
}
