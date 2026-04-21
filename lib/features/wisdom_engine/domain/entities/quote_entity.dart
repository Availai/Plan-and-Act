import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_entity.freezed.dart';
part 'quote_entity.g.dart';

/// Domain entity for a motivational quote.
@freezed
class QuoteEntity with _$QuoteEntity {
  const factory QuoteEntity({
    required String id,
    required String text,
    required String figureId,
    String? sourceId,
    @Default('tr') String languageCode,
    @Default('attributed') String trustStatus,
    @Default(0.8) double attributionConfidence,
    @Default('direct') String tone,
    @Default(5) int usageFrequencyCap,
    String? sensitivityNotes,
    @Default(true) bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _QuoteEntity;

  factory QuoteEntity.fromJson(Map<String, dynamic> json) =>
      _$QuoteEntityFromJson(json);
}
