import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/video_model.dart';

class VideoRepo {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<VideoModel>> getVideos() async {
    try {
      final response = await _supabase
          .from(AppConstants.videosTable)
          .select()
          .order('created_at', ascending: false);

      if (response.isNotEmpty) {
        return response.map((json) => VideoModel.fromJson(json)).toList();
      }

      // Return sample videos if no data in database
      return VideoModel.getSampleVideos();
    } catch (e) {
      // Return sample videos on error
      return VideoModel.getSampleVideos();
    }
  }

  Future<VideoModel?> getVideoById(String videoId) async {
    try {
      final response = await _supabase
          .from(AppConstants.videosTable)
          .select()
          .eq('id', videoId)
          .maybeSingle();

      if (response != null) {
        return VideoModel.fromJson(response);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> incrementViews(String videoId) async {
    try {
      final video = await getVideoById(videoId);
      if (video != null) {
        await _supabase
            .from(AppConstants.videosTable)
            .update({'views': video.views + 1})
            .eq('id', videoId);
      }
    } catch (e) {
      // Ignore error for views increment
    }
  }
}