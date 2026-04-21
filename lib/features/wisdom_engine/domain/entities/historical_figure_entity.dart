import 'package:freezed_annotation/freezed_annotation.dart';

part 'historical_figure_entity.freezed.dart';
part 'historical_figure_entity.g.dart';

/// Domain entity for a historical figure.
@freezed
class HistoricalFigureEntity with _$HistoricalFigureEntity {
  const factory HistoricalFigureEntity({
    required String id,
    required String name,
    String? era,
    String? shortBio,
    String? imageUrl,
    @Default(true) bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _HistoricalFigureEntity;

  factory HistoricalFigureEntity.fromJson(Map<String, dynamic> json) =>
      _$HistoricalFigureEntityFromJson(json);
}
