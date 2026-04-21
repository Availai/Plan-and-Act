// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_status_history_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanStatusHistoryEntryImpl _$$PlanStatusHistoryEntryImplFromJson(
  Map<String, dynamic> json,
) => _$PlanStatusHistoryEntryImpl(
  id: json['id'] as String,
  planId: json['planId'] as String,
  userId: json['userId'] as String,
  fromStatus: json['fromStatus'] as String?,
  toStatus: json['toStatus'] as String,
  changeReason: json['changeReason'] as String?,
  metadataJson: json['metadataJson'] as String?,
  changedAt: DateTime.parse(json['changedAt'] as String),
);

Map<String, dynamic> _$$PlanStatusHistoryEntryImplToJson(
  _$PlanStatusHistoryEntryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'planId': instance.planId,
  'userId': instance.userId,
  'fromStatus': instance.fromStatus,
  'toStatus': instance.toStatus,
  'changeReason': instance.changeReason,
  'metadataJson': instance.metadataJson,
  'changedAt': instance.changedAt.toIso8601String(),
};
