import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_status_history_entry.freezed.dart';
part 'plan_status_history_entry.g.dart';

/// Immutable record of a plan status transition.
@freezed
class PlanStatusHistoryEntry with _$PlanStatusHistoryEntry {
  const factory PlanStatusHistoryEntry({
    required String id,
    required String planId,
    required String userId,
    String? fromStatus,
    required String toStatus,
    String? changeReason,
    String? metadataJson,
    required DateTime changedAt,
  }) = _PlanStatusHistoryEntry;

  factory PlanStatusHistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$PlanStatusHistoryEntryFromJson(json);
}
