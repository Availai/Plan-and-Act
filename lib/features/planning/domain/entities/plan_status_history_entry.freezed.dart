// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_status_history_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlanStatusHistoryEntry _$PlanStatusHistoryEntryFromJson(
  Map<String, dynamic> json,
) {
  return _PlanStatusHistoryEntry.fromJson(json);
}

/// @nodoc
mixin _$PlanStatusHistoryEntry {
  String get id => throw _privateConstructorUsedError;
  String get planId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get fromStatus => throw _privateConstructorUsedError;
  String get toStatus => throw _privateConstructorUsedError;
  String? get changeReason => throw _privateConstructorUsedError;
  String? get metadataJson => throw _privateConstructorUsedError;
  DateTime get changedAt => throw _privateConstructorUsedError;

  /// Serializes this PlanStatusHistoryEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlanStatusHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanStatusHistoryEntryCopyWith<PlanStatusHistoryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanStatusHistoryEntryCopyWith<$Res> {
  factory $PlanStatusHistoryEntryCopyWith(
    PlanStatusHistoryEntry value,
    $Res Function(PlanStatusHistoryEntry) then,
  ) = _$PlanStatusHistoryEntryCopyWithImpl<$Res, PlanStatusHistoryEntry>;
  @useResult
  $Res call({
    String id,
    String planId,
    String userId,
    String? fromStatus,
    String toStatus,
    String? changeReason,
    String? metadataJson,
    DateTime changedAt,
  });
}

/// @nodoc
class _$PlanStatusHistoryEntryCopyWithImpl<
  $Res,
  $Val extends PlanStatusHistoryEntry
>
    implements $PlanStatusHistoryEntryCopyWith<$Res> {
  _$PlanStatusHistoryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanStatusHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? userId = null,
    Object? fromStatus = freezed,
    Object? toStatus = null,
    Object? changeReason = freezed,
    Object? metadataJson = freezed,
    Object? changedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            planId: null == planId
                ? _value.planId
                : planId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            fromStatus: freezed == fromStatus
                ? _value.fromStatus
                : fromStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            toStatus: null == toStatus
                ? _value.toStatus
                : toStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            changeReason: freezed == changeReason
                ? _value.changeReason
                : changeReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadataJson: freezed == metadataJson
                ? _value.metadataJson
                : metadataJson // ignore: cast_nullable_to_non_nullable
                      as String?,
            changedAt: null == changedAt
                ? _value.changedAt
                : changedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlanStatusHistoryEntryImplCopyWith<$Res>
    implements $PlanStatusHistoryEntryCopyWith<$Res> {
  factory _$$PlanStatusHistoryEntryImplCopyWith(
    _$PlanStatusHistoryEntryImpl value,
    $Res Function(_$PlanStatusHistoryEntryImpl) then,
  ) = __$$PlanStatusHistoryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String planId,
    String userId,
    String? fromStatus,
    String toStatus,
    String? changeReason,
    String? metadataJson,
    DateTime changedAt,
  });
}

/// @nodoc
class __$$PlanStatusHistoryEntryImplCopyWithImpl<$Res>
    extends
        _$PlanStatusHistoryEntryCopyWithImpl<$Res, _$PlanStatusHistoryEntryImpl>
    implements _$$PlanStatusHistoryEntryImplCopyWith<$Res> {
  __$$PlanStatusHistoryEntryImplCopyWithImpl(
    _$PlanStatusHistoryEntryImpl _value,
    $Res Function(_$PlanStatusHistoryEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlanStatusHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? userId = null,
    Object? fromStatus = freezed,
    Object? toStatus = null,
    Object? changeReason = freezed,
    Object? metadataJson = freezed,
    Object? changedAt = null,
  }) {
    return _then(
      _$PlanStatusHistoryEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        planId: null == planId
            ? _value.planId
            : planId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        fromStatus: freezed == fromStatus
            ? _value.fromStatus
            : fromStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        toStatus: null == toStatus
            ? _value.toStatus
            : toStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        changeReason: freezed == changeReason
            ? _value.changeReason
            : changeReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadataJson: freezed == metadataJson
            ? _value.metadataJson
            : metadataJson // ignore: cast_nullable_to_non_nullable
                  as String?,
        changedAt: null == changedAt
            ? _value.changedAt
            : changedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanStatusHistoryEntryImpl implements _PlanStatusHistoryEntry {
  const _$PlanStatusHistoryEntryImpl({
    required this.id,
    required this.planId,
    required this.userId,
    this.fromStatus,
    required this.toStatus,
    this.changeReason,
    this.metadataJson,
    required this.changedAt,
  });

  factory _$PlanStatusHistoryEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanStatusHistoryEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String planId;
  @override
  final String userId;
  @override
  final String? fromStatus;
  @override
  final String toStatus;
  @override
  final String? changeReason;
  @override
  final String? metadataJson;
  @override
  final DateTime changedAt;

  @override
  String toString() {
    return 'PlanStatusHistoryEntry(id: $id, planId: $planId, userId: $userId, fromStatus: $fromStatus, toStatus: $toStatus, changeReason: $changeReason, metadataJson: $metadataJson, changedAt: $changedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanStatusHistoryEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fromStatus, fromStatus) ||
                other.fromStatus == fromStatus) &&
            (identical(other.toStatus, toStatus) ||
                other.toStatus == toStatus) &&
            (identical(other.changeReason, changeReason) ||
                other.changeReason == changeReason) &&
            (identical(other.metadataJson, metadataJson) ||
                other.metadataJson == metadataJson) &&
            (identical(other.changedAt, changedAt) ||
                other.changedAt == changedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    planId,
    userId,
    fromStatus,
    toStatus,
    changeReason,
    metadataJson,
    changedAt,
  );

  /// Create a copy of PlanStatusHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanStatusHistoryEntryImplCopyWith<_$PlanStatusHistoryEntryImpl>
  get copyWith =>
      __$$PlanStatusHistoryEntryImplCopyWithImpl<_$PlanStatusHistoryEntryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanStatusHistoryEntryImplToJson(this);
  }
}

abstract class _PlanStatusHistoryEntry implements PlanStatusHistoryEntry {
  const factory _PlanStatusHistoryEntry({
    required final String id,
    required final String planId,
    required final String userId,
    final String? fromStatus,
    required final String toStatus,
    final String? changeReason,
    final String? metadataJson,
    required final DateTime changedAt,
  }) = _$PlanStatusHistoryEntryImpl;

  factory _PlanStatusHistoryEntry.fromJson(Map<String, dynamic> json) =
      _$PlanStatusHistoryEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get planId;
  @override
  String get userId;
  @override
  String? get fromStatus;
  @override
  String get toStatus;
  @override
  String? get changeReason;
  @override
  String? get metadataJson;
  @override
  DateTime get changedAt;

  /// Create a copy of PlanStatusHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanStatusHistoryEntryImplCopyWith<_$PlanStatusHistoryEntryImpl>
  get copyWith => throw _privateConstructorUsedError;
}
