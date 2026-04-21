import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_entity.freezed.dart';
part 'video_entity.g.dart';

/// Core domain entity for a daily video.
@freezed
class VideoEntity with _$VideoEntity {
  const factory VideoEntity({
    required String id,
    required String youtubeVideoId,
    required String title,
    required String description,
    required String thumbnailUrl,
    required String channelTitle,
    required DateTime publishedAt,
    required String canonicalUrl,
    required List<String> topics,
  }) = _VideoEntity;

  factory VideoEntity.fromJson(Map<String, dynamic> json) =>
      _$VideoEntityFromJson(json);
}
