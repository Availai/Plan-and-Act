// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wisdom_decision.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WisdomDecision _$WisdomDecisionFromJson(Map<String, dynamic> json) {
  return _WisdomDecision.fromJson(json);
}

/// @nodoc
mixin _$WisdomDecision {
  String? get selectedQuoteId => throw _privateConstructorUsedError;
  String? get selectedQuoteText => throw _privateConstructorUsedError;
  String? get historicalFigureName => throw _privateConstructorUsedError;
  String? get sourceReference => throw _privateConstructorUsedError;
  List<String> get selectedCategories => throw _privateConstructorUsedError;
  FallbackTier get fallbackTier => throw _privateConstructorUsedError;
  double get finalScore => throw _privateConstructorUsedError;
  ScoreBreakdown? get scoreBreakdown => throw _privateConstructorUsedError;
  List<RejectedCandidate> get topRejectedCandidates =>
      throw _privateConstructorUsedError;
  String get userFacingExplanation => throw _privateConstructorUsedError;
  String get debugExplanation => throw _privateConstructorUsedError;
  DateTime get decisionTimestamp => throw _privateConstructorUsedError;

  /// Serializes this WisdomDecision to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WisdomDecision
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WisdomDecisionCopyWith<WisdomDecision> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WisdomDecisionCopyWith<$Res> {
  factory $WisdomDecisionCopyWith(
    WisdomDecision value,
    $Res Function(WisdomDecision) then,
  ) = _$WisdomDecisionCopyWithImpl<$Res, WisdomDecision>;
  @useResult
  $Res call({
    String? selectedQuoteId,
    String? selectedQuoteText,
    String? historicalFigureName,
    String? sourceReference,
    List<String> selectedCategories,
    FallbackTier fallbackTier,
    double finalScore,
    ScoreBreakdown? scoreBreakdown,
    List<RejectedCandidate> topRejectedCandidates,
    String userFacingExplanation,
    String debugExplanation,
    DateTime decisionTimestamp,
  });

  $ScoreBreakdownCopyWith<$Res>? get scoreBreakdown;
}

/// @nodoc
class _$WisdomDecisionCopyWithImpl<$Res, $Val extends WisdomDecision>
    implements $WisdomDecisionCopyWith<$Res> {
  _$WisdomDecisionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WisdomDecision
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedQuoteId = freezed,
    Object? selectedQuoteText = freezed,
    Object? historicalFigureName = freezed,
    Object? sourceReference = freezed,
    Object? selectedCategories = null,
    Object? fallbackTier = null,
    Object? finalScore = null,
    Object? scoreBreakdown = freezed,
    Object? topRejectedCandidates = null,
    Object? userFacingExplanation = null,
    Object? debugExplanation = null,
    Object? decisionTimestamp = null,
  }) {
    return _then(
      _value.copyWith(
            selectedQuoteId: freezed == selectedQuoteId
                ? _value.selectedQuoteId
                : selectedQuoteId // ignore: cast_nullable_to_non_nullable
                      as String?,
            selectedQuoteText: freezed == selectedQuoteText
                ? _value.selectedQuoteText
                : selectedQuoteText // ignore: cast_nullable_to_non_nullable
                      as String?,
            historicalFigureName: freezed == historicalFigureName
                ? _value.historicalFigureName
                : historicalFigureName // ignore: cast_nullable_to_non_nullable
                      as String?,
            sourceReference: freezed == sourceReference
                ? _value.sourceReference
                : sourceReference // ignore: cast_nullable_to_non_nullable
                      as String?,
            selectedCategories: null == selectedCategories
                ? _value.selectedCategories
                : selectedCategories // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            fallbackTier: null == fallbackTier
                ? _value.fallbackTier
                : fallbackTier // ignore: cast_nullable_to_non_nullable
                      as FallbackTier,
            finalScore: null == finalScore
                ? _value.finalScore
                : finalScore // ignore: cast_nullable_to_non_nullable
                      as double,
            scoreBreakdown: freezed == scoreBreakdown
                ? _value.scoreBreakdown
                : scoreBreakdown // ignore: cast_nullable_to_non_nullable
                      as ScoreBreakdown?,
            topRejectedCandidates: null == topRejectedCandidates
                ? _value.topRejectedCandidates
                : topRejectedCandidates // ignore: cast_nullable_to_non_nullable
                      as List<RejectedCandidate>,
            userFacingExplanation: null == userFacingExplanation
                ? _value.userFacingExplanation
                : userFacingExplanation // ignore: cast_nullable_to_non_nullable
                      as String,
            debugExplanation: null == debugExplanation
                ? _value.debugExplanation
                : debugExplanation // ignore: cast_nullable_to_non_nullable
                      as String,
            decisionTimestamp: null == decisionTimestamp
                ? _value.decisionTimestamp
                : decisionTimestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of WisdomDecision
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScoreBreakdownCopyWith<$Res>? get scoreBreakdown {
    if (_value.scoreBreakdown == null) {
      return null;
    }

    return $ScoreBreakdownCopyWith<$Res>(_value.scoreBreakdown!, (value) {
      return _then(_value.copyWith(scoreBreakdown: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WisdomDecisionImplCopyWith<$Res>
    implements $WisdomDecisionCopyWith<$Res> {
  factory _$$WisdomDecisionImplCopyWith(
    _$WisdomDecisionImpl value,
    $Res Function(_$WisdomDecisionImpl) then,
  ) = __$$WisdomDecisionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? selectedQuoteId,
    String? selectedQuoteText,
    String? historicalFigureName,
    String? sourceReference,
    List<String> selectedCategories,
    FallbackTier fallbackTier,
    double finalScore,
    ScoreBreakdown? scoreBreakdown,
    List<RejectedCandidate> topRejectedCandidates,
    String userFacingExplanation,
    String debugExplanation,
    DateTime decisionTimestamp,
  });

  @override
  $ScoreBreakdownCopyWith<$Res>? get scoreBreakdown;
}

/// @nodoc
class __$$WisdomDecisionImplCopyWithImpl<$Res>
    extends _$WisdomDecisionCopyWithImpl<$Res, _$WisdomDecisionImpl>
    implements _$$WisdomDecisionImplCopyWith<$Res> {
  __$$WisdomDecisionImplCopyWithImpl(
    _$WisdomDecisionImpl _value,
    $Res Function(_$WisdomDecisionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WisdomDecision
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedQuoteId = freezed,
    Object? selectedQuoteText = freezed,
    Object? historicalFigureName = freezed,
    Object? sourceReference = freezed,
    Object? selectedCategories = null,
    Object? fallbackTier = null,
    Object? finalScore = null,
    Object? scoreBreakdown = freezed,
    Object? topRejectedCandidates = null,
    Object? userFacingExplanation = null,
    Object? debugExplanation = null,
    Object? decisionTimestamp = null,
  }) {
    return _then(
      _$WisdomDecisionImpl(
        selectedQuoteId: freezed == selectedQuoteId
            ? _value.selectedQuoteId
            : selectedQuoteId // ignore: cast_nullable_to_non_nullable
                  as String?,
        selectedQuoteText: freezed == selectedQuoteText
            ? _value.selectedQuoteText
            : selectedQuoteText // ignore: cast_nullable_to_non_nullable
                  as String?,
        historicalFigureName: freezed == historicalFigureName
            ? _value.historicalFigureName
            : historicalFigureName // ignore: cast_nullable_to_non_nullable
                  as String?,
        sourceReference: freezed == sourceReference
            ? _value.sourceReference
            : sourceReference // ignore: cast_nullable_to_non_nullable
                  as String?,
        selectedCategories: null == selectedCategories
            ? _value._selectedCategories
            : selectedCategories // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        fallbackTier: null == fallbackTier
            ? _value.fallbackTier
            : fallbackTier // ignore: cast_nullable_to_non_nullable
                  as FallbackTier,
        finalScore: null == finalScore
            ? _value.finalScore
            : finalScore // ignore: cast_nullable_to_non_nullable
                  as double,
        scoreBreakdown: freezed == scoreBreakdown
            ? _value.scoreBreakdown
            : scoreBreakdown // ignore: cast_nullable_to_non_nullable
                  as ScoreBreakdown?,
        topRejectedCandidates: null == topRejectedCandidates
            ? _value._topRejectedCandidates
            : topRejectedCandidates // ignore: cast_nullable_to_non_nullable
                  as List<RejectedCandidate>,
        userFacingExplanation: null == userFacingExplanation
            ? _value.userFacingExplanation
            : userFacingExplanation // ignore: cast_nullable_to_non_nullable
                  as String,
        debugExplanation: null == debugExplanation
            ? _value.debugExplanation
            : debugExplanation // ignore: cast_nullable_to_non_nullable
                  as String,
        decisionTimestamp: null == decisionTimestamp
            ? _value.decisionTimestamp
            : decisionTimestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WisdomDecisionImpl implements _WisdomDecision {
  const _$WisdomDecisionImpl({
    this.selectedQuoteId,
    this.selectedQuoteText,
    this.historicalFigureName,
    this.sourceReference,
    final List<String> selectedCategories = const [],
    this.fallbackTier = FallbackTier.exactMatch,
    this.finalScore = 0.0,
    this.scoreBreakdown,
    final List<RejectedCandidate> topRejectedCandidates = const [],
    this.userFacingExplanation = '',
    this.debugExplanation = '',
    required this.decisionTimestamp,
  }) : _selectedCategories = selectedCategories,
       _topRejectedCandidates = topRejectedCandidates;

  factory _$WisdomDecisionImpl.fromJson(Map<String, dynamic> json) =>
      _$$WisdomDecisionImplFromJson(json);

  @override
  final String? selectedQuoteId;
  @override
  final String? selectedQuoteText;
  @override
  final String? historicalFigureName;
  @override
  final String? sourceReference;
  final List<String> _selectedCategories;
  @override
  @JsonKey()
  List<String> get selectedCategories {
    if (_selectedCategories is EqualUnmodifiableListView)
      return _selectedCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCategories);
  }

  @override
  @JsonKey()
  final FallbackTier fallbackTier;
  @override
  @JsonKey()
  final double finalScore;
  @override
  final ScoreBreakdown? scoreBreakdown;
  final List<RejectedCandidate> _topRejectedCandidates;
  @override
  @JsonKey()
  List<RejectedCandidate> get topRejectedCandidates {
    if (_topRejectedCandidates is EqualUnmodifiableListView)
      return _topRejectedCandidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topRejectedCandidates);
  }

  @override
  @JsonKey()
  final String userFacingExplanation;
  @override
  @JsonKey()
  final String debugExplanation;
  @override
  final DateTime decisionTimestamp;

  @override
  String toString() {
    return 'WisdomDecision(selectedQuoteId: $selectedQuoteId, selectedQuoteText: $selectedQuoteText, historicalFigureName: $historicalFigureName, sourceReference: $sourceReference, selectedCategories: $selectedCategories, fallbackTier: $fallbackTier, finalScore: $finalScore, scoreBreakdown: $scoreBreakdown, topRejectedCandidates: $topRejectedCandidates, userFacingExplanation: $userFacingExplanation, debugExplanation: $debugExplanation, decisionTimestamp: $decisionTimestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WisdomDecisionImpl &&
            (identical(other.selectedQuoteId, selectedQuoteId) ||
                other.selectedQuoteId == selectedQuoteId) &&
            (identical(other.selectedQuoteText, selectedQuoteText) ||
                other.selectedQuoteText == selectedQuoteText) &&
            (identical(other.historicalFigureName, historicalFigureName) ||
                other.historicalFigureName == historicalFigureName) &&
            (identical(other.sourceReference, sourceReference) ||
                other.sourceReference == sourceReference) &&
            const DeepCollectionEquality().equals(
              other._selectedCategories,
              _selectedCategories,
            ) &&
            (identical(other.fallbackTier, fallbackTier) ||
                other.fallbackTier == fallbackTier) &&
            (identical(other.finalScore, finalScore) ||
                other.finalScore == finalScore) &&
            (identical(other.scoreBreakdown, scoreBreakdown) ||
                other.scoreBreakdown == scoreBreakdown) &&
            const DeepCollectionEquality().equals(
              other._topRejectedCandidates,
              _topRejectedCandidates,
            ) &&
            (identical(other.userFacingExplanation, userFacingExplanation) ||
                other.userFacingExplanation == userFacingExplanation) &&
            (identical(other.debugExplanation, debugExplanation) ||
                other.debugExplanation == debugExplanation) &&
            (identical(other.decisionTimestamp, decisionTimestamp) ||
                other.decisionTimestamp == decisionTimestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    selectedQuoteId,
    selectedQuoteText,
    historicalFigureName,
    sourceReference,
    const DeepCollectionEquality().hash(_selectedCategories),
    fallbackTier,
    finalScore,
    scoreBreakdown,
    const DeepCollectionEquality().hash(_topRejectedCandidates),
    userFacingExplanation,
    debugExplanation,
    decisionTimestamp,
  );

  /// Create a copy of WisdomDecision
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WisdomDecisionImplCopyWith<_$WisdomDecisionImpl> get copyWith =>
      __$$WisdomDecisionImplCopyWithImpl<_$WisdomDecisionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WisdomDecisionImplToJson(this);
  }
}

abstract class _WisdomDecision implements WisdomDecision {
  const factory _WisdomDecision({
    final String? selectedQuoteId,
    final String? selectedQuoteText,
    final String? historicalFigureName,
    final String? sourceReference,
    final List<String> selectedCategories,
    final FallbackTier fallbackTier,
    final double finalScore,
    final ScoreBreakdown? scoreBreakdown,
    final List<RejectedCandidate> topRejectedCandidates,
    final String userFacingExplanation,
    final String debugExplanation,
    required final DateTime decisionTimestamp,
  }) = _$WisdomDecisionImpl;

  factory _WisdomDecision.fromJson(Map<String, dynamic> json) =
      _$WisdomDecisionImpl.fromJson;

  @override
  String? get selectedQuoteId;
  @override
  String? get selectedQuoteText;
  @override
  String? get historicalFigureName;
  @override
  String? get sourceReference;
  @override
  List<String> get selectedCategories;
  @override
  FallbackTier get fallbackTier;
  @override
  double get finalScore;
  @override
  ScoreBreakdown? get scoreBreakdown;
  @override
  List<RejectedCandidate> get topRejectedCandidates;
  @override
  String get userFacingExplanation;
  @override
  String get debugExplanation;
  @override
  DateTime get decisionTimestamp;

  /// Create a copy of WisdomDecision
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WisdomDecisionImplCopyWith<_$WisdomDecisionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RejectedCandidate _$RejectedCandidateFromJson(Map<String, dynamic> json) {
  return _RejectedCandidate.fromJson(json);
}

/// @nodoc
mixin _$RejectedCandidate {
  String get quoteId => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  String get rejectionReason => throw _privateConstructorUsedError;

  /// Serializes this RejectedCandidate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RejectedCandidate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RejectedCandidateCopyWith<RejectedCandidate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RejectedCandidateCopyWith<$Res> {
  factory $RejectedCandidateCopyWith(
    RejectedCandidate value,
    $Res Function(RejectedCandidate) then,
  ) = _$RejectedCandidateCopyWithImpl<$Res, RejectedCandidate>;
  @useResult
  $Res call({String quoteId, double score, String rejectionReason});
}

/// @nodoc
class _$RejectedCandidateCopyWithImpl<$Res, $Val extends RejectedCandidate>
    implements $RejectedCandidateCopyWith<$Res> {
  _$RejectedCandidateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RejectedCandidate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quoteId = null,
    Object? score = null,
    Object? rejectionReason = null,
  }) {
    return _then(
      _value.copyWith(
            quoteId: null == quoteId
                ? _value.quoteId
                : quoteId // ignore: cast_nullable_to_non_nullable
                      as String,
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as double,
            rejectionReason: null == rejectionReason
                ? _value.rejectionReason
                : rejectionReason // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RejectedCandidateImplCopyWith<$Res>
    implements $RejectedCandidateCopyWith<$Res> {
  factory _$$RejectedCandidateImplCopyWith(
    _$RejectedCandidateImpl value,
    $Res Function(_$RejectedCandidateImpl) then,
  ) = __$$RejectedCandidateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String quoteId, double score, String rejectionReason});
}

/// @nodoc
class __$$RejectedCandidateImplCopyWithImpl<$Res>
    extends _$RejectedCandidateCopyWithImpl<$Res, _$RejectedCandidateImpl>
    implements _$$RejectedCandidateImplCopyWith<$Res> {
  __$$RejectedCandidateImplCopyWithImpl(
    _$RejectedCandidateImpl _value,
    $Res Function(_$RejectedCandidateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RejectedCandidate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quoteId = null,
    Object? score = null,
    Object? rejectionReason = null,
  }) {
    return _then(
      _$RejectedCandidateImpl(
        quoteId: null == quoteId
            ? _value.quoteId
            : quoteId // ignore: cast_nullable_to_non_nullable
                  as String,
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as double,
        rejectionReason: null == rejectionReason
            ? _value.rejectionReason
            : rejectionReason // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RejectedCandidateImpl implements _RejectedCandidate {
  const _$RejectedCandidateImpl({
    required this.quoteId,
    required this.score,
    required this.rejectionReason,
  });

  factory _$RejectedCandidateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RejectedCandidateImplFromJson(json);

  @override
  final String quoteId;
  @override
  final double score;
  @override
  final String rejectionReason;

  @override
  String toString() {
    return 'RejectedCandidate(quoteId: $quoteId, score: $score, rejectionReason: $rejectionReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectedCandidateImpl &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, quoteId, score, rejectionReason);

  /// Create a copy of RejectedCandidate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectedCandidateImplCopyWith<_$RejectedCandidateImpl> get copyWith =>
      __$$RejectedCandidateImplCopyWithImpl<_$RejectedCandidateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RejectedCandidateImplToJson(this);
  }
}

abstract class _RejectedCandidate implements RejectedCandidate {
  const factory _RejectedCandidate({
    required final String quoteId,
    required final double score,
    required final String rejectionReason,
  }) = _$RejectedCandidateImpl;

  factory _RejectedCandidate.fromJson(Map<String, dynamic> json) =
      _$RejectedCandidateImpl.fromJson;

  @override
  String get quoteId;
  @override
  double get score;
  @override
  String get rejectionReason;

  /// Create a copy of RejectedCandidate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectedCandidateImplCopyWith<_$RejectedCandidateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
