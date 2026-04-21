import 'package:planandact/features/video_of_the_day/domain/entities/video_entity.dart';

/// Interface for fetching video metadata from the cloud backend.
abstract class RemoteVideoDataSource {
  /// Fetches the featured video payload for a given date.
  Future<VideoEntity> fetchDailyVideo(DateTime targetDate);
}

/// Mock implementation simulating a Supabase Edge Function call.
class MockRemoteVideoDataSource implements RemoteVideoDataSource {
  @override
  Future<VideoEntity> fetchDailyVideo(DateTime targetDate) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    // For testing, we mock a payload. In reality, this comes from 
    // a Supabase edge function calling YouTube Data API.
    return VideoEntity(
      id: 'vid_${targetDate.millisecondsSinceEpoch}',
      youtubeVideoId: 'dQw4w9WgXcQ', // Placeholder
      title: 'Discipline Equals Freedom - Jocko Willink',
      description: 'A powerful talk on how discipline creates freedom in your life.',
      thumbnailUrl: 'https://img.youtube.com/vi/dQw4w9WgXcQ/maxresdefault.jpg',
      channelTitle: 'TEDx',
      publishedAt: DateTime.utc(2020, 1, 1),
      canonicalUrl: 'https://youtube.com/watch?v=dQw4w9WgXcQ',
      topics: ['discipline', 'action', 'focus'],
    );
  }
}
