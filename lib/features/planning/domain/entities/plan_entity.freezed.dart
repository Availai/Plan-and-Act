// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlanEntity _$PlanEntityFromJson(Map<String, dynamic> json) {
  return _PlanEntity.fromJson(json);
}

/// @nodoc
mixin _$PlanEntity {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError; // Scheduling
  DateTime get scheduledDate => throw _privateConstructorUsedError;
  String get scheduledTimeLocal => throw _privateConstructorUsedError;
  String get scheduledTimezone => throw _privateConstructorUsedError;
  DateTime get scheduledAtUtc => throw _privateConstructorUsedError;
  int? get durationMinutes =>
      throw _privateConstructorUsedError; // Classification
  String? get categoryId => throw _privateConstructorUsedError;
  PlanPriority get priority => throw _privateConstructorUsedError;
  PlanStatus get status => throw _privateConstructorUsedError; // Reminder
  bool get reminderEnabled => throw _privateConstructorUsedError;
  String? get reminderTimeLocal => throw _privateConstructorUsedError;
  DateTime? get reminderAtUtc => throw _privateConstructorUsedError; // Tracking
  int get postponedCount => throw _privateConstructorUsedError;
  String? get motivationContextSnapshot =>
      throw _privateConstructorUsedError; // Audit
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;

  /// Serializes this PlanEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlanEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanEntityCopyWith<PlanEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanEntityCopyWith<$Res> {
  factory $PlanEntityCopyWith(
    PlanEntity value,
    $Res Function(PlanEntity) then,
  ) = _$PlanEntityCopyWithImpl<$Res, PlanEntity>;
  @useResult
  $Res call({
    String id,
    String userId,
    String title,
    String description,
    DateTime scheduledDate,
    String scheduledTimeLocal,
    String scheduledTimezone,
    DateTime scheduledAtUtc,
    int? durationMinutes,
    String? categoryId,
    PlanPriority priority,
    PlanStatus status,
    bool reminderEnabled,
    String? reminderTimeLocal,
    DateTime? reminderAtUtc,
    int postponedCount,
    String? motivationContextSnapshot,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? completedAt,
    DateTime? deletedAt,
    int version,
  });
}

/// @nodoc
class _$PlanEntityCopyWithImpl<$Res, $Val extends PlanEntity>
    implements $PlanEntityCopyWith<$Res> {
  _$PlanEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? scheduledDate = null,
    Object? scheduledTimeLocal = null,
    Object? scheduledTimezone = null,
    Object? scheduledAtUtc = null,
    Object? durationMinutes = freezed,
    Object? categoryId = freezed,
    Object? priority = null,
    Object? status = null,
    Object? reminderEnabled = null,
    Object? reminderTimeLocal = freezed,
    Object? reminderAtUtc = freezed,
    Object? postponedCount = null,
    Object? motivationContextSnapshot = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? completedAt = freezed,
    Object? deletedAt = freezed,
    Object? version = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            scheduledDate: null == scheduledDate
                ? _value.scheduledDate
                : scheduledDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            scheduledTimeLocal: null == scheduledTimeLocal
                ? _value.scheduledTimeLocal
                : scheduledTimeLocal // ignore: cast_nullable_to_non_nullable
                      as String,
            scheduledTimezone: null == scheduledTimezone
                ? _value.scheduledTimezone
                : scheduledTimezone // ignore: cast_nullable_to_non_nullable
                      as String,
            scheduledAtUtc: null == scheduledAtUtc
                ? _value.scheduledAtUtc
                : scheduledAtUtc // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            durationMinutes: freezed == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            categoryId: freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String?,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as PlanPriority,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as PlanStatus,
            reminderEnabled: null == reminderEnabled
                ? _value.reminderEnabled
                : reminderEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            reminderTimeLocal: freezed == reminderTimeLocal
                ? _value.reminderTimeLocal
                : reminderTimeLocal // ignore: cast_nullable_to_non_nullable
                      as String?,
            reminderAtUtc: freezed == reminderAtUtc
                ? _value.reminderAtUtc
                : reminderAtUtc // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            postponedCount: null == postponedCount
                ? _value.postponedCount
                : postponedCount // ignore: cast_nullable_to_non_nullable
                      as int,
            motivationContextSnapshot: freezed == motivationContextSnapshot
                ? _value.motivationContextSnapshot
                : motivationContextSnapshot // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            deletedAt: freezed == deletedAt
                ? _value.deletedAt
                : deletedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlanEntityImplCopyWith<$Res>
    implements $PlanEntityCopyWith<$Res> {
  factory _$$PlanEntityImplCopyWith(
    _$PlanEntityImpl value,
    $Res Function(_$PlanEntityImpl) then,
  ) = __$$PlanEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String title,
    String description,
    DateTime scheduledDate,
    String scheduledTimeLocal,
    String scheduledTimezone,
    DateTime scheduledAtUtc,
    int? durationMinutes,
    String? categoryId,
    PlanPriority priority,
    PlanStatus status,
    bool reminderEnabled,
    String? reminderTimeLocal,
    DateTime? reminderAtUtc,
    int postponedCount,
    String? motivationContextSnapshot,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? completedAt,
    DateTime? deletedAt,
    int version,
  });
}

/// @nodoc
class __$$PlanEntityImplCopyWithImpl<$Res>
    extends _$PlanEntityCopyWithImpl<$Res, _$PlanEntityImpl>
    implements _$$PlanEntityImplCopyWith<$Res> {
  __$$PlanEntityImplCopyWithImpl(
    _$PlanEntityImpl _value,
    $Res Function(_$PlanEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlanEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? scheduledDate = null,
    Object? scheduledTimeLocal = null,
    Object? scheduledTimezone = null,
    Object? scheduledAtUtc = null,
    Object? durationMinutes = freezed,
    Object? categoryId = freezed,
    Object? priority = null,
    Object? status = null,
    Object? reminderEnabled = null,
    Object? reminderTimeLocal = freezed,
    Object? reminderAtUtc = freezed,
    Object? postponedCount = null,
    Object? motivationContextSnapshot = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? completedAt = freezed,
    Object? deletedAt = freezed,
    Object? version = null,
  }) {
    return _then(
      _$PlanEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        scheduledDate: null == scheduledDate
            ? _value.scheduledDate
            : scheduledDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        scheduledTimeLocal: null == scheduledTimeLocal
            ? _value.scheduledTimeLocal
            : scheduledTimeLocal // ignore: cast_nullable_to_non_nullable
                  as String,
        scheduledTimezone: null == scheduledTimezone
            ? _value.scheduledTimezone
            : scheduledTimezone // ignore: cast_nullable_to_non_nullable
                  as String,
        scheduledAtUtc: null == scheduledAtUtc
            ? _value.scheduledAtUtc
            : scheduledAtUtc // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        durationMinutes: freezed == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        categoryId: freezed == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as PlanPriority,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PlanStatus,
        reminderEnabled: null == reminderEnabled
            ? _value.reminderEnabled
            : reminderEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        reminderTimeLocal: freezed == reminderTimeLocal
            ? _value.reminderTimeLocal
            : reminderTimeLocal // ignore: cast_nullable_to_non_nullable
                  as String?,
        reminderAtUtc: freezed == reminderAtUtc
            ? _value.reminderAtUtc
            : reminderAtUtc // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        postponedCount: null == postponedCount
            ? _value.postponedCount
            : postponedCount // ignore: cast_nullable_to_non_nullable
                  as int,
        motivationContextSnapshot: freezed == motivationContextSnapshot
            ? _value.motivationContextSnapshot
            : motivationContextSnapshot // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        deletedAt: freezed == deletedAt
            ? _value.deletedAt
            : deletedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanEntityImpl extends _PlanEntity {
  const _$PlanEntityImpl({
    required this.id,
    required this.userId,
    required this.title,
    this.description = '',
    required this.scheduledDate,
    required this.scheduledTimeLocal,
    this.scheduledTimezone = 'Europe/Istanbul',
    required this.scheduledAtUtc,
    this.durationMinutes,
    this.categoryId,
    this.priority = PlanPriority.medium,
    this.status = PlanStatus.planned,
    this.reminderEnabled = false,
    this.reminderTimeLocal,
    this.reminderAtUtc,
    this.postponedCount = 0,
    this.motivationContextSnapshot,
    required this.createdAt,
    required this.updatedAt,
    this.completedAt,
    this.deletedAt,
    this.version = 1,
  }) : super._();

  factory _$PlanEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String title;
  @override
  @JsonKey()
  final String description;
  // Scheduling
  @override
  final DateTime scheduledDate;
  @override
  final String scheduledTimeLocal;
  @override
  @JsonKey()
  final String scheduledTimezone;
  @override
  final DateTime scheduledAtUtc;
  @override
  final int? durationMinutes;
  // Classification
  @override
  final String? categoryId;
  @override
  @JsonKey()
  final PlanPriority priority;
  @override
  @JsonKey()
  final PlanStatus status;
  // Reminder
  @override
  @JsonKey()
  final bool reminderEnabled;
  @override
  final String? reminderTimeLocal;
  @override
  final DateTime? reminderAtUtc;
  // Tracking
  @override
  @JsonKey()
  final int postponedCount;
  @override
  final String? motivationContextSnapshot;
  // Audit
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? completedAt;
  @override
  final DateTime? deletedAt;
  @override
  @JsonKey()
  final int version;

  @override
  String toString() {
    return 'PlanEntity(id: $id, userId: $userId, title: $title, description: $description, scheduledDate: $scheduledDate, scheduledTimeLocal: $scheduledTimeLocal, scheduledTimezone: $scheduledTimezone, scheduledAtUtc: $scheduledAtUtc, durationMinutes: $durationMinutes, categoryId: $categoryId, priority: $priority, status: $status, reminderEnabled: $reminderEnabled, reminderTimeLocal: $reminderTimeLocal, reminderAtUtc: $reminderAtUtc, postponedCount: $postponedCount, motivationContextSnapshot: $motivationContextSnapshot, createdAt: $createdAt, updatedAt: $updatedAt, completedAt: $completedAt, deletedAt: $deletedAt, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.scheduledTimeLocal, scheduledTimeLocal) ||
                other.scheduledTimeLocal == scheduledTimeLocal) &&
            (identical(other.scheduledTimezone, scheduledTimezone) ||
                other.scheduledTimezone == scheduledTimezone) &&
            (identical(other.scheduledAtUtc, scheduledAtUtc) ||
                other.scheduledAtUtc == scheduledAtUtc) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reminderEnabled, reminderEnabled) ||
                other.reminderEnabled == reminderEnabled) &&
            (identical(other.reminderTimeLocal, reminderTimeLocal) ||
                other.reminderTimeLocal == reminderTimeLocal) &&
            (identical(other.reminderAtUtc, reminderAtUtc) ||
                other.reminderAtUtc == reminderAtUtc) &&
            (identical(other.postponedCount, postponedCount) ||
                other.postponedCount == postponedCount) &&
            (identical(
                  other.motivationContextSnapshot,
                  motivationContextSnapshot,
                ) ||
                other.motivationContextSnapshot == motivationContextSnapshot) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    userId,
    title,
    description,
    scheduledDate,
    scheduledTimeLocal,
    scheduledTimezone,
    scheduledAtUtc,
    durationMinutes,
    categoryId,
    priority,
    status,
    reminderEnabled,
    reminderTimeLocal,
    reminderAtUtc,
    postponedCount,
    motivationContextSnapshot,
    createdAt,
    updatedAt,
    completedAt,
    deletedAt,
    version,
  ]);

  /// Create a copy of PlanEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanEntityImplCopyWith<_$PlanEntityImpl> get copyWith =>
      __$$PlanEntityImplCopyWithImpl<_$PlanEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanEntityImplToJson(this);
  }
}

abstract class _PlanEntity extends PlanEntity {
  const factory _PlanEntity({
    required final String id,
    required final String userId,
    required final String title,
    final String description,
    required final DateTime scheduledDate,
    required final String scheduledTimeLocal,
    final String scheduledTimezone,
    required final DateTime scheduledAtUtc,
    final int? durationMinutes,
    final String? categoryId,
    final PlanPriority priority,
    final PlanStatus status,
    final bool reminderEnabled,
    final String? reminderTimeLocal,
    final DateTime? reminderAtUtc,
    final int postponedCount,
    final String? motivationContextSnapshot,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final DateTime? completedAt,
    final DateTime? deletedAt,
    final int version,
  }) = _$PlanEntityImpl;
  const _PlanEntity._() : super._();

  factory _PlanEntity.fromJson(Map<String, dynamic> json) =
      _$PlanEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get description; // Scheduling
  @override
  DateTime get scheduledDate;
  @override
  String get scheduledTimeLocal;
  @override
  String get scheduledTimezone;
  @override
  DateTime get scheduledAtUtc;
  @override
  int? get durationMinutes; // Classification
  @override
  String? get categoryId;
  @override
  PlanPriority get priority;
  @override
  PlanStatus get status; // Reminder
  @override
  bool get reminderEnabled;
  @override
  String? get reminderTimeLocal;
  @override
  DateTime? get reminderAtUtc; // Tracking
  @override
  int get postponedCount;
  @override
  String? get motivationContextSnapshot; // Audit
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get completedAt;
  @override
  DateTime? get deletedAt;
  @override
  int get version;

  /// Create a copy of PlanEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanEntityImplCopyWith<_$PlanEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
