// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wisdom_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WisdomContext _$WisdomContextFromJson(Map<String, dynamic> json) {
  return _WisdomContext.fromJson(json);
}

/// @nodoc
mixin _$WisdomContext {
  String get planId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get scheduledAt => throw _privateConstructorUsedError;
  int? get durationMinutes => throw _privateConstructorUsedError;
  String? get categorySlug => throw _privateConstructorUsedError;
  PlanPriority get priority => throw _privateConstructorUsedError;
  PlanStatus get currentStatus => throw _privateConstructorUsedError;
  int get currentStreak => throw _privateConstructorUsedError;
  double get recentCompletionRate7d => throw _privateConstructorUsedError;
  int get recentPostponementCount7d => throw _privateConstructorUsedError;
  int get recentSkipCount7d => throw _privateConstructorUsedError;
  String get timeOfDaySegment =>
      throw _privateConstructorUsedError; // morning, afternoon, night
  Tone get preferredTone => throw _privateConstructorUsedError;
  List<String> get recentQuoteIds => throw _privateConstructorUsedError;
  List<String> get recentFigureIds => throw _privateConstructorUsedError;
  List<String> get recentSemanticBuckets => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;

  /// Serializes this WisdomContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WisdomContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WisdomContextCopyWith<WisdomContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WisdomContextCopyWith<$Res> {
  factory $WisdomContextCopyWith(
    WisdomContext value,
    $Res Function(WisdomContext) then,
  ) = _$WisdomContextCopyWithImpl<$Res, WisdomContext>;
  @useResult
  $Res call({
    String planId,
    String userId,
    String title,
    String description,
    DateTime scheduledAt,
    int? durationMinutes,
    String? categorySlug,
    PlanPriority priority,
    PlanStatus currentStatus,
    int currentStreak,
    double recentCompletionRate7d,
    int recentPostponementCount7d,
    int recentSkipCount7d,
    String timeOfDaySegment,
    Tone preferredTone,
    List<String> recentQuoteIds,
    List<String> recentFigureIds,
    List<String> recentSemanticBuckets,
    String locale,
    String timezone,
  });
}

/// @nodoc
class _$WisdomContextCopyWithImpl<$Res, $Val extends WisdomContext>
    implements $WisdomContextCopyWith<$Res> {
  _$WisdomContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WisdomContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? scheduledAt = null,
    Object? durationMinutes = freezed,
    Object? categorySlug = freezed,
    Object? priority = null,
    Object? currentStatus = null,
    Object? currentStreak = null,
    Object? recentCompletionRate7d = null,
    Object? recentPostponementCount7d = null,
    Object? recentSkipCount7d = null,
    Object? timeOfDaySegment = null,
    Object? preferredTone = null,
    Object? recentQuoteIds = null,
    Object? recentFigureIds = null,
    Object? recentSemanticBuckets = null,
    Object? locale = null,
    Object? timezone = null,
  }) {
    return _then(
      _value.copyWith(
            planId: null == planId
                ? _value.planId
                : planId // ignore: cast_nullable_to_non_nullable
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
            scheduledAt: null == scheduledAt
                ? _value.scheduledAt
                : scheduledAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            durationMinutes: freezed == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            categorySlug: freezed == categorySlug
                ? _value.categorySlug
                : categorySlug // ignore: cast_nullable_to_non_nullable
                      as String?,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as PlanPriority,
            currentStatus: null == currentStatus
                ? _value.currentStatus
                : currentStatus // ignore: cast_nullable_to_non_nullable
                      as PlanStatus,
            currentStreak: null == currentStreak
                ? _value.currentStreak
                : currentStreak // ignore: cast_nullable_to_non_nullable
                      as int,
            recentCompletionRate7d: null == recentCompletionRate7d
                ? _value.recentCompletionRate7d
                : recentCompletionRate7d // ignore: cast_nullable_to_non_nullable
                      as double,
            recentPostponementCount7d: null == recentPostponementCount7d
                ? _value.recentPostponementCount7d
                : recentPostponementCount7d // ignore: cast_nullable_to_non_nullable
                      as int,
            recentSkipCount7d: null == recentSkipCount7d
                ? _value.recentSkipCount7d
                : recentSkipCount7d // ignore: cast_nullable_to_non_nullable
                      as int,
            timeOfDaySegment: null == timeOfDaySegment
                ? _value.timeOfDaySegment
                : timeOfDaySegment // ignore: cast_nullable_to_non_nullable
                      as String,
            preferredTone: null == preferredTone
                ? _value.preferredTone
                : preferredTone // ignore: cast_nullable_to_non_nullable
                      as Tone,
            recentQuoteIds: null == recentQuoteIds
                ? _value.recentQuoteIds
                : recentQuoteIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            recentFigureIds: null == recentFigureIds
                ? _value.recentFigureIds
                : recentFigureIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            recentSemanticBuckets: null == recentSemanticBuckets
                ? _value.recentSemanticBuckets
                : recentSemanticBuckets // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            locale: null == locale
                ? _value.locale
                : locale // ignore: cast_nullable_to_non_nullable
                      as String,
            timezone: null == timezone
                ? _value.timezone
                : timezone // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WisdomContextImplCopyWith<$Res>
    implements $WisdomContextCopyWith<$Res> {
  factory _$$WisdomContextImplCopyWith(
    _$WisdomContextImpl value,
    $Res Function(_$WisdomContextImpl) then,
  ) = __$$WisdomContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String planId,
    String userId,
    String title,
    String description,
    DateTime scheduledAt,
    int? durationMinutes,
    String? categorySlug,
    PlanPriority priority,
    PlanStatus currentStatus,
    int currentStreak,
    double recentCompletionRate7d,
    int recentPostponementCount7d,
    int recentSkipCount7d,
    String timeOfDaySegment,
    Tone preferredTone,
    List<String> recentQuoteIds,
    List<String> recentFigureIds,
    List<String> recentSemanticBuckets,
    String locale,
    String timezone,
  });
}

/// @nodoc
class __$$WisdomContextImplCopyWithImpl<$Res>
    extends _$WisdomContextCopyWithImpl<$Res, _$WisdomContextImpl>
    implements _$$WisdomContextImplCopyWith<$Res> {
  __$$WisdomContextImplCopyWithImpl(
    _$WisdomContextImpl _value,
    $Res Function(_$WisdomContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WisdomContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? scheduledAt = null,
    Object? durationMinutes = freezed,
    Object? categorySlug = freezed,
    Object? priority = null,
    Object? currentStatus = null,
    Object? currentStreak = null,
    Object? recentCompletionRate7d = null,
    Object? recentPostponementCount7d = null,
    Object? recentSkipCount7d = null,
    Object? timeOfDaySegment = null,
    Object? preferredTone = null,
    Object? recentQuoteIds = null,
    Object? recentFigureIds = null,
    Object? recentSemanticBuckets = null,
    Object? locale = null,
    Object? timezone = null,
  }) {
    return _then(
      _$WisdomContextImpl(
        planId: null == planId
            ? _value.planId
            : planId // ignore: cast_nullable_to_non_nullable
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
        scheduledAt: null == scheduledAt
            ? _value.scheduledAt
            : scheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        durationMinutes: freezed == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        categorySlug: freezed == categorySlug
            ? _value.categorySlug
            : categorySlug // ignore: cast_nullable_to_non_nullable
                  as String?,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as PlanPriority,
        currentStatus: null == currentStatus
            ? _value.currentStatus
            : currentStatus // ignore: cast_nullable_to_non_nullable
                  as PlanStatus,
        currentStreak: null == currentStreak
            ? _value.currentStreak
            : currentStreak // ignore: cast_nullable_to_non_nullable
                  as int,
        recentCompletionRate7d: null == recentCompletionRate7d
            ? _value.recentCompletionRate7d
            : recentCompletionRate7d // ignore: cast_nullable_to_non_nullable
                  as double,
        recentPostponementCount7d: null == recentPostponementCount7d
            ? _value.recentPostponementCount7d
            : recentPostponementCount7d // ignore: cast_nullable_to_non_nullable
                  as int,
        recentSkipCount7d: null == recentSkipCount7d
            ? _value.recentSkipCount7d
            : recentSkipCount7d // ignore: cast_nullable_to_non_nullable
                  as int,
        timeOfDaySegment: null == timeOfDaySegment
            ? _value.timeOfDaySegment
            : timeOfDaySegment // ignore: cast_nullable_to_non_nullable
                  as String,
        preferredTone: null == preferredTone
            ? _value.preferredTone
            : preferredTone // ignore: cast_nullable_to_non_nullable
                  as Tone,
        recentQuoteIds: null == recentQuoteIds
            ? _value._recentQuoteIds
            : recentQuoteIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        recentFigureIds: null == recentFigureIds
            ? _value._recentFigureIds
            : recentFigureIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        recentSemanticBuckets: null == recentSemanticBuckets
            ? _value._recentSemanticBuckets
            : recentSemanticBuckets // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        locale: null == locale
            ? _value.locale
            : locale // ignore: cast_nullable_to_non_nullable
                  as String,
        timezone: null == timezone
            ? _value.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WisdomContextImpl extends _WisdomContext {
  const _$WisdomContextImpl({
    required this.planId,
    required this.userId,
    required this.title,
    this.description = '',
    required this.scheduledAt,
    this.durationMinutes,
    this.categorySlug,
    this.priority = PlanPriority.medium,
    this.currentStatus = PlanStatus.planned,
    this.currentStreak = 0,
    this.recentCompletionRate7d = 1.0,
    this.recentPostponementCount7d = 0,
    this.recentSkipCount7d = 0,
    required this.timeOfDaySegment,
    this.preferredTone = Tone.direct,
    final List<String> recentQuoteIds = const [],
    final List<String> recentFigureIds = const [],
    final List<String> recentSemanticBuckets = const [],
    this.locale = 'tr',
    this.timezone = 'Europe/Istanbul',
  }) : _recentQuoteIds = recentQuoteIds,
       _recentFigureIds = recentFigureIds,
       _recentSemanticBuckets = recentSemanticBuckets,
       super._();

  factory _$WisdomContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$WisdomContextImplFromJson(json);

  @override
  final String planId;
  @override
  final String userId;
  @override
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime scheduledAt;
  @override
  final int? durationMinutes;
  @override
  final String? categorySlug;
  @override
  @JsonKey()
  final PlanPriority priority;
  @override
  @JsonKey()
  final PlanStatus currentStatus;
  @override
  @JsonKey()
  final int currentStreak;
  @override
  @JsonKey()
  final double recentCompletionRate7d;
  @override
  @JsonKey()
  final int recentPostponementCount7d;
  @override
  @JsonKey()
  final int recentSkipCount7d;
  @override
  final String timeOfDaySegment;
  // morning, afternoon, night
  @override
  @JsonKey()
  final Tone preferredTone;
  final List<String> _recentQuoteIds;
  @override
  @JsonKey()
  List<String> get recentQuoteIds {
    if (_recentQuoteIds is EqualUnmodifiableListView) return _recentQuoteIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentQuoteIds);
  }

  final List<String> _recentFigureIds;
  @override
  @JsonKey()
  List<String> get recentFigureIds {
    if (_recentFigureIds is EqualUnmodifiableListView) return _recentFigureIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentFigureIds);
  }

  final List<String> _recentSemanticBuckets;
  @override
  @JsonKey()
  List<String> get recentSemanticBuckets {
    if (_recentSemanticBuckets is EqualUnmodifiableListView)
      return _recentSemanticBuckets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentSemanticBuckets);
  }

  @override
  @JsonKey()
  final String locale;
  @override
  @JsonKey()
  final String timezone;

  @override
  String toString() {
    return 'WisdomContext(planId: $planId, userId: $userId, title: $title, description: $description, scheduledAt: $scheduledAt, durationMinutes: $durationMinutes, categorySlug: $categorySlug, priority: $priority, currentStatus: $currentStatus, currentStreak: $currentStreak, recentCompletionRate7d: $recentCompletionRate7d, recentPostponementCount7d: $recentPostponementCount7d, recentSkipCount7d: $recentSkipCount7d, timeOfDaySegment: $timeOfDaySegment, preferredTone: $preferredTone, recentQuoteIds: $recentQuoteIds, recentFigureIds: $recentFigureIds, recentSemanticBuckets: $recentSemanticBuckets, locale: $locale, timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WisdomContextImpl &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.currentStatus, currentStatus) ||
                other.currentStatus == currentStatus) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.recentCompletionRate7d, recentCompletionRate7d) ||
                other.recentCompletionRate7d == recentCompletionRate7d) &&
            (identical(
                  other.recentPostponementCount7d,
                  recentPostponementCount7d,
                ) ||
                other.recentPostponementCount7d == recentPostponementCount7d) &&
            (identical(other.recentSkipCount7d, recentSkipCount7d) ||
                other.recentSkipCount7d == recentSkipCount7d) &&
            (identical(other.timeOfDaySegment, timeOfDaySegment) ||
                other.timeOfDaySegment == timeOfDaySegment) &&
            (identical(other.preferredTone, preferredTone) ||
                other.preferredTone == preferredTone) &&
            const DeepCollectionEquality().equals(
              other._recentQuoteIds,
              _recentQuoteIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._recentFigureIds,
              _recentFigureIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._recentSemanticBuckets,
              _recentSemanticBuckets,
            ) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    planId,
    userId,
    title,
    description,
    scheduledAt,
    durationMinutes,
    categorySlug,
    priority,
    currentStatus,
    currentStreak,
    recentCompletionRate7d,
    recentPostponementCount7d,
    recentSkipCount7d,
    timeOfDaySegment,
    preferredTone,
    const DeepCollectionEquality().hash(_recentQuoteIds),
    const DeepCollectionEquality().hash(_recentFigureIds),
    const DeepCollectionEquality().hash(_recentSemanticBuckets),
    locale,
    timezone,
  ]);

  /// Create a copy of WisdomContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WisdomContextImplCopyWith<_$WisdomContextImpl> get copyWith =>
      __$$WisdomContextImplCopyWithImpl<_$WisdomContextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WisdomContextImplToJson(this);
  }
}

abstract class _WisdomContext extends WisdomContext {
  const factory _WisdomContext({
    required final String planId,
    required final String userId,
    required final String title,
    final String description,
    required final DateTime scheduledAt,
    final int? durationMinutes,
    final String? categorySlug,
    final PlanPriority priority,
    final PlanStatus currentStatus,
    final int currentStreak,
    final double recentCompletionRate7d,
    final int recentPostponementCount7d,
    final int recentSkipCount7d,
    required final String timeOfDaySegment,
    final Tone preferredTone,
    final List<String> recentQuoteIds,
    final List<String> recentFigureIds,
    final List<String> recentSemanticBuckets,
    final String locale,
    final String timezone,
  }) = _$WisdomContextImpl;
  const _WisdomContext._() : super._();

  factory _WisdomContext.fromJson(Map<String, dynamic> json) =
      _$WisdomContextImpl.fromJson;

  @override
  String get planId;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get scheduledAt;
  @override
  int? get durationMinutes;
  @override
  String? get categorySlug;
  @override
  PlanPriority get priority;
  @override
  PlanStatus get currentStatus;
  @override
  int get currentStreak;
  @override
  double get recentCompletionRate7d;
  @override
  int get recentPostponementCount7d;
  @override
  int get recentSkipCount7d;
  @override
  String get timeOfDaySegment; // morning, afternoon, night
  @override
  Tone get preferredTone;
  @override
  List<String> get recentQuoteIds;
  @override
  List<String> get recentFigureIds;
  @override
  List<String> get recentSemanticBuckets;
  @override
  String get locale;
  @override
  String get timezone;

  /// Create a copy of WisdomContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WisdomContextImplCopyWith<_$WisdomContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
