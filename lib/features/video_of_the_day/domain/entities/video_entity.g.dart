// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoEntityImpl _$$VideoEntityImplFromJson(Map<String, dynamic> json) =>
    _$VideoEntityImpl(
      id: json['id'] as String,
      youtubeVideoId: json['youtubeVideoId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      channelTitle: json['channelTitle'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      canonicalUrl: json['canonicalUrl'] as String,
      topics: (json['topics'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$VideoEntityImplToJson(_$VideoEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'youtubeVideoId': instance.youtubeVideoId,
      'title': instance.title,
      'description': instance.description,
      'thumbnailUrl': instance.thumbnailUrl,
      'channelTitle': instance.channelTitle,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'canonicalUrl': instance.canonicalUrl,
      'topics': instance.topics,
    };
