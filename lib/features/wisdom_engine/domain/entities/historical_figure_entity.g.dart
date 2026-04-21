// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historical_figure_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoricalFigureEntityImpl _$$HistoricalFigureEntityImplFromJson(
  Map<String, dynamic> json,
) => _$HistoricalFigureEntityImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  era: json['era'] as String?,
  shortBio: json['shortBio'] as String?,
  imageUrl: json['imageUrl'] as String?,
  isActive: json['isActive'] as bool? ?? true,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$HistoricalFigureEntityImplToJson(
  _$HistoricalFigureEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'era': instance.era,
  'shortBio': instance.shortBio,
  'imageUrl': instance.imageUrl,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
