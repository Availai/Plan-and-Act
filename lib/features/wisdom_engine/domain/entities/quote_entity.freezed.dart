// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuoteEntity _$QuoteEntityFromJson(Map<String, dynamic> json) {
  return _QuoteEntity.fromJson(json);
}

/// @nodoc
mixin _$QuoteEntity {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get figureId => throw _privateConstructorUsedError;
  String? get sourceId => throw _privateConstructorUsedError;
  String get languageCode => throw _privateConstructorUsedError;
  String get trustStatus => throw _privateConstructorUsedError;
  double get attributionConfidence => throw _privateConstructorUsedError;
  String get tone => throw _privateConstructorUsedError;
  int get usageFrequencyCap => throw _privateConstructorUsedError;
  String? get sensitivityNotes => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this QuoteEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuoteEntityCopyWith<QuoteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteEntityCopyWith<$Res> {
  factory $QuoteEntityCopyWith(
    QuoteEntity value,
    $Res Function(QuoteEntity) then,
  ) = _$QuoteEntityCopyWithImpl<$Res, QuoteEntity>;
  @useResult
  $Res call({
    String id,
    String text,
    String figureId,
    String? sourceId,
    String languageCode,
    String trustStatus,
    double attributionConfidence,
    String tone,
    int usageFrequencyCap,
    String? sensitivityNotes,
    bool isActive,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$QuoteEntityCopyWithImpl<$Res, $Val extends QuoteEntity>
    implements $QuoteEntityCopyWith<$Res> {
  _$QuoteEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? figureId = null,
    Object? sourceId = freezed,
    Object? languageCode = null,
    Object? trustStatus = null,
    Object? attributionConfidence = null,
    Object? tone = null,
    Object? usageFrequencyCap = null,
    Object? sensitivityNotes = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            figureId: null == figureId
                ? _value.figureId
                : figureId // ignore: cast_nullable_to_non_nullable
                      as String,
            sourceId: freezed == sourceId
                ? _value.sourceId
                : sourceId // ignore: cast_nullable_to_non_nullable
                      as String?,
            languageCode: null == languageCode
                ? _value.languageCode
                : languageCode // ignore: cast_nullable_to_non_nullable
                      as String,
            trustStatus: null == trustStatus
                ? _value.trustStatus
                : trustStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            attributionConfidence: null == attributionConfidence
                ? _value.attributionConfidence
                : attributionConfidence // ignore: cast_nullable_to_non_nullable
                      as double,
            tone: null == tone
                ? _value.tone
                : tone // ignore: cast_nullable_to_non_nullable
                      as String,
            usageFrequencyCap: null == usageFrequencyCap
                ? _value.usageFrequencyCap
                : usageFrequencyCap // ignore: cast_nullable_to_non_nullable
                      as int,
            sensitivityNotes: freezed == sensitivityNotes
                ? _value.sensitivityNotes
                : sensitivityNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuoteEntityImplCopyWith<$Res>
    implements $QuoteEntityCopyWith<$Res> {
  factory _$$QuoteEntityImplCopyWith(
    _$QuoteEntityImpl value,
    $Res Function(_$QuoteEntityImpl) then,
  ) = __$$QuoteEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String text,
    String figureId,
    String? sourceId,
    String languageCode,
    String trustStatus,
    double attributionConfidence,
    String tone,
    int usageFrequencyCap,
    String? sensitivityNotes,
    bool isActive,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$QuoteEntityImplCopyWithImpl<$Res>
    extends _$QuoteEntityCopyWithImpl<$Res, _$QuoteEntityImpl>
    implements _$$QuoteEntityImplCopyWith<$Res> {
  __$$QuoteEntityImplCopyWithImpl(
    _$QuoteEntityImpl _value,
    $Res Function(_$QuoteEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? figureId = null,
    Object? sourceId = freezed,
    Object? languageCode = null,
    Object? trustStatus = null,
    Object? attributionConfidence = null,
    Object? tone = null,
    Object? usageFrequencyCap = null,
    Object? sensitivityNotes = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$QuoteEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        figureId: null == figureId
            ? _value.figureId
            : figureId // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceId: freezed == sourceId
            ? _value.sourceId
            : sourceId // ignore: cast_nullable_to_non_nullable
                  as String?,
        languageCode: null == languageCode
            ? _value.languageCode
            : languageCode // ignore: cast_nullable_to_non_nullable
                  as String,
        trustStatus: null == trustStatus
            ? _value.trustStatus
            : trustStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        attributionConfidence: null == attributionConfidence
            ? _value.attributionConfidence
            : attributionConfidence // ignore: cast_nullable_to_non_nullable
                  as double,
        tone: null == tone
            ? _value.tone
            : tone // ignore: cast_nullable_to_non_nullable
                  as String,
        usageFrequencyCap: null == usageFrequencyCap
            ? _value.usageFrequencyCap
            : usageFrequencyCap // ignore: cast_nullable_to_non_nullable
                  as int,
        sensitivityNotes: freezed == sensitivityNotes
            ? _value.sensitivityNotes
            : sensitivityNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuoteEntityImpl implements _QuoteEntity {
  const _$QuoteEntityImpl({
    required this.id,
    required this.text,
    required this.figureId,
    this.sourceId,
    this.languageCode = 'tr',
    this.trustStatus = 'attributed',
    this.attributionConfidence = 0.8,
    this.tone = 'direct',
    this.usageFrequencyCap = 5,
    this.sensitivityNotes,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$QuoteEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuoteEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final String figureId;
  @override
  final String? sourceId;
  @override
  @JsonKey()
  final String languageCode;
  @override
  @JsonKey()
  final String trustStatus;
  @override
  @JsonKey()
  final double attributionConfidence;
  @override
  @JsonKey()
  final String tone;
  @override
  @JsonKey()
  final int usageFrequencyCap;
  @override
  final String? sensitivityNotes;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'QuoteEntity(id: $id, text: $text, figureId: $figureId, sourceId: $sourceId, languageCode: $languageCode, trustStatus: $trustStatus, attributionConfidence: $attributionConfidence, tone: $tone, usageFrequencyCap: $usageFrequencyCap, sensitivityNotes: $sensitivityNotes, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuoteEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.figureId, figureId) ||
                other.figureId == figureId) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.trustStatus, trustStatus) ||
                other.trustStatus == trustStatus) &&
            (identical(other.attributionConfidence, attributionConfidence) ||
                other.attributionConfidence == attributionConfidence) &&
            (identical(other.tone, tone) || other.tone == tone) &&
            (identical(other.usageFrequencyCap, usageFrequencyCap) ||
                other.usageFrequencyCap == usageFrequencyCap) &&
            (identical(other.sensitivityNotes, sensitivityNotes) ||
                other.sensitivityNotes == sensitivityNotes) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    text,
    figureId,
    sourceId,
    languageCode,
    trustStatus,
    attributionConfidence,
    tone,
    usageFrequencyCap,
    sensitivityNotes,
    isActive,
    createdAt,
    updatedAt,
  );

  /// Create a copy of QuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteEntityImplCopyWith<_$QuoteEntityImpl> get copyWith =>
      __$$QuoteEntityImplCopyWithImpl<_$QuoteEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuoteEntityImplToJson(this);
  }
}

abstract class _QuoteEntity implements QuoteEntity {
  const factory _QuoteEntity({
    required final String id,
    required final String text,
    required final String figureId,
    final String? sourceId,
    final String languageCode,
    final String trustStatus,
    final double attributionConfidence,
    final String tone,
    final int usageFrequencyCap,
    final String? sensitivityNotes,
    final bool isActive,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$QuoteEntityImpl;

  factory _QuoteEntity.fromJson(Map<String, dynamic> json) =
      _$QuoteEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  String get figureId;
  @override
  String? get sourceId;
  @override
  String get languageCode;
  @override
  String get trustStatus;
  @override
  double get attributionConfidence;
  @override
  String get tone;
  @override
  int get usageFrequencyCap;
  @override
  String? get sensitivityNotes;
  @override
  bool get isActive;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of QuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuoteEntityImplCopyWith<_$QuoteEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
