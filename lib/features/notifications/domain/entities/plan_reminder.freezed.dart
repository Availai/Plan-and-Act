// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlanReminder _$PlanReminderFromJson(Map<String, dynamic> json) {
  return _PlanReminder.fromJson(json);
}

/// @nodoc
mixin _$PlanReminder {
  String get id => throw _privateConstructorUsedError;
  String get planId => throw _privateConstructorUsedError;
  DateTime get scheduledFor => throw _privateConstructorUsedError;
  ReminderStatus get status => throw _privateConstructorUsedError;
  String get notificationPayload => throw _privateConstructorUsedError;
  DateTime? get lastScheduledAt => throw _privateConstructorUsedError;
  String? get lastError => throw _privateConstructorUsedError;

  /// Serializes this PlanReminder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlanReminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanReminderCopyWith<PlanReminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanReminderCopyWith<$Res> {
  factory $PlanReminderCopyWith(
    PlanReminder value,
    $Res Function(PlanReminder) then,
  ) = _$PlanReminderCopyWithImpl<$Res, PlanReminder>;
  @useResult
  $Res call({
    String id,
    String planId,
    DateTime scheduledFor,
    ReminderStatus status,
    String notificationPayload,
    DateTime? lastScheduledAt,
    String? lastError,
  });
}

/// @nodoc
class _$PlanReminderCopyWithImpl<$Res, $Val extends PlanReminder>
    implements $PlanReminderCopyWith<$Res> {
  _$PlanReminderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanReminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? scheduledFor = null,
    Object? status = null,
    Object? notificationPayload = null,
    Object? lastScheduledAt = freezed,
    Object? lastError = freezed,
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
            scheduledFor: null == scheduledFor
                ? _value.scheduledFor
                : scheduledFor // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ReminderStatus,
            notificationPayload: null == notificationPayload
                ? _value.notificationPayload
                : notificationPayload // ignore: cast_nullable_to_non_nullable
                      as String,
            lastScheduledAt: freezed == lastScheduledAt
                ? _value.lastScheduledAt
                : lastScheduledAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            lastError: freezed == lastError
                ? _value.lastError
                : lastError // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlanReminderImplCopyWith<$Res>
    implements $PlanReminderCopyWith<$Res> {
  factory _$$PlanReminderImplCopyWith(
    _$PlanReminderImpl value,
    $Res Function(_$PlanReminderImpl) then,
  ) = __$$PlanReminderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String planId,
    DateTime scheduledFor,
    ReminderStatus status,
    String notificationPayload,
    DateTime? lastScheduledAt,
    String? lastError,
  });
}

/// @nodoc
class __$$PlanReminderImplCopyWithImpl<$Res>
    extends _$PlanReminderCopyWithImpl<$Res, _$PlanReminderImpl>
    implements _$$PlanReminderImplCopyWith<$Res> {
  __$$PlanReminderImplCopyWithImpl(
    _$PlanReminderImpl _value,
    $Res Function(_$PlanReminderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlanReminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? scheduledFor = null,
    Object? status = null,
    Object? notificationPayload = null,
    Object? lastScheduledAt = freezed,
    Object? lastError = freezed,
  }) {
    return _then(
      _$PlanReminderImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        planId: null == planId
            ? _value.planId
            : planId // ignore: cast_nullable_to_non_nullable
                  as String,
        scheduledFor: null == scheduledFor
            ? _value.scheduledFor
            : scheduledFor // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ReminderStatus,
        notificationPayload: null == notificationPayload
            ? _value.notificationPayload
            : notificationPayload // ignore: cast_nullable_to_non_nullable
                  as String,
        lastScheduledAt: freezed == lastScheduledAt
            ? _value.lastScheduledAt
            : lastScheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        lastError: freezed == lastError
            ? _value.lastError
            : lastError // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanReminderImpl implements _PlanReminder {
  const _$PlanReminderImpl({
    required this.id,
    required this.planId,
    required this.scheduledFor,
    this.status = ReminderStatus.scheduled,
    required this.notificationPayload,
    this.lastScheduledAt,
    this.lastError,
  });

  factory _$PlanReminderImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanReminderImplFromJson(json);

  @override
  final String id;
  @override
  final String planId;
  @override
  final DateTime scheduledFor;
  @override
  @JsonKey()
  final ReminderStatus status;
  @override
  final String notificationPayload;
  @override
  final DateTime? lastScheduledAt;
  @override
  final String? lastError;

  @override
  String toString() {
    return 'PlanReminder(id: $id, planId: $planId, scheduledFor: $scheduledFor, status: $status, notificationPayload: $notificationPayload, lastScheduledAt: $lastScheduledAt, lastError: $lastError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanReminderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.scheduledFor, scheduledFor) ||
                other.scheduledFor == scheduledFor) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notificationPayload, notificationPayload) ||
                other.notificationPayload == notificationPayload) &&
            (identical(other.lastScheduledAt, lastScheduledAt) ||
                other.lastScheduledAt == lastScheduledAt) &&
            (identical(other.lastError, lastError) ||
                other.lastError == lastError));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    planId,
    scheduledFor,
    status,
    notificationPayload,
    lastScheduledAt,
    lastError,
  );

  /// Create a copy of PlanReminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanReminderImplCopyWith<_$PlanReminderImpl> get copyWith =>
      __$$PlanReminderImplCopyWithImpl<_$PlanReminderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanReminderImplToJson(this);
  }
}

abstract class _PlanReminder implements PlanReminder {
  const factory _PlanReminder({
    required final String id,
    required final String planId,
    required final DateTime scheduledFor,
    final ReminderStatus status,
    required final String notificationPayload,
    final DateTime? lastScheduledAt,
    final String? lastError,
  }) = _$PlanReminderImpl;

  factory _PlanReminder.fromJson(Map<String, dynamic> json) =
      _$PlanReminderImpl.fromJson;

  @override
  String get id;
  @override
  String get planId;
  @override
  DateTime get scheduledFor;
  @override
  ReminderStatus get status;
  @override
  String get notificationPayload;
  @override
  DateTime? get lastScheduledAt;
  @override
  String? get lastError;

  /// Create a copy of PlanReminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanReminderImplCopyWith<_$PlanReminderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
