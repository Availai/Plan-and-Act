// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuoteEntityImpl _$$QuoteEntityImplFromJson(Map<String, dynamic> json) =>
    _$QuoteEntityImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      figureId: json['figureId'] as String,
      sourceId: json['sourceId'] as String?,
      languageCode: json['languageCode'] as String? ?? 'tr',
      trustStatus: json['trustStatus'] as String? ?? 'attributed',
      attributionConfidence:
          (json['attributionConfidence'] as num?)?.toDouble() ?? 0.8,
      tone: json['tone'] as String? ?? 'direct',
      usageFrequencyCap: (json['usageFrequencyCap'] as num?)?.toInt() ?? 5,
      sensitivityNotes: json['sensitivityNotes'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$QuoteEntityImplToJson(_$QuoteEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'figureId': instance.figureId,
      'sourceId': instance.sourceId,
      'languageCode': instance.languageCode,
      'trustStatus': instance.trustStatus,
      'attributionConfidence': instance.attributionConfidence,
      'tone': instance.tone,
      'usageFrequencyCap': instance.usageFrequencyCap,
      'sensitivityNotes': instance.sensitivityNotes,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
