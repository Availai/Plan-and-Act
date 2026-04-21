import 'package:drift/drift.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_priority.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_status.dart';
import 'package:planandact/shared/data/local/app_database.dart';

/// Maps between Drift [Plan] row and domain [PlanEntity].
class PlanMapper {
  const PlanMapper();

  /// Drift row → Domain entity.
  PlanEntity toDomain(Plan row) {
    return PlanEntity(
      id: row.id,
      userId: row.userId,
      title: row.title,
      description: row.description,
      scheduledDate: row.scheduledDate,
      scheduledTimeLocal: row.scheduledTimeLocal,
      scheduledTimezone: row.scheduledTimezone,
      scheduledAtUtc: row.scheduledAtUtc,
      durationMinutes: row.durationMinutes,
      categoryId: row.categoryId,
      priority: PlanPriority.values.firstWhere(
        (p) => p.name == row.priority,
        orElse: () => PlanPriority.medium,
      ),
      status: PlanStatus.values.firstWhere(
        (s) => s.name == row.status,
        orElse: () => PlanStatus.planned,
      ),
      reminderEnabled: row.reminderEnabled,
      reminderTimeLocal: row.reminderTimeLocal,
      reminderAtUtc: row.reminderAtUtc,
      postponedCount: row.postponedCount,
      motivationContextSnapshot: row.motivationContextSnapshot,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      completedAt: row.completedAt,
      deletedAt: row.deletedAt,
      version: row.version,
    );
  }

  /// Domain entity → Drift companion for insert/update.
  PlansCompanion toCompanion(PlanEntity entity) {
    return PlansCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      title: Value(entity.title),
      description: Value(entity.description),
      scheduledDate: Value(entity.scheduledDate),
      scheduledTimeLocal: Value(entity.scheduledTimeLocal),
      scheduledTimezone: Value(entity.scheduledTimezone),
      scheduledAtUtc: Value(entity.scheduledAtUtc),
      durationMinutes: Value(entity.durationMinutes),
      categoryId: Value(entity.categoryId),
      priority: Value(entity.priority.name),
      status: Value(entity.status.name),
      reminderEnabled: Value(entity.reminderEnabled),
      reminderTimeLocal: Value(entity.reminderTimeLocal),
      reminderAtUtc: Value(entity.reminderAtUtc),
      postponedCount: Value(entity.postponedCount),
      motivationContextSnapshot: Value(entity.motivationContextSnapshot),
      createdAt: Value(entity.createdAt),
      updatedAt: Value(entity.updatedAt),
      completedAt: Value(entity.completedAt),
      deletedAt: Value(entity.deletedAt),
      version: Value(entity.version),
    );
  }

  /// Maps a list of Drift rows to domain entities.
  List<PlanEntity> toDomainList(List<Plan> rows) {
    return rows.map(toDomain).toList();
  }
}
