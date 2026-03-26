import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/favorite_model.dart';

class FavoritesRepo {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<FavoriteModel>> getFavorites(String userId) async {
    try {
      final response = await _supabase
          .from(AppConstants.favoritesTable)
          .select()
          .eq('user_id', userId);

      return response.map((json) => FavoriteModel.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<bool> isFavorite(String userId, String videoId) async {
    try {
      final response = await _supabase
          .from(AppConstants.favoritesTable)
          .select()
          .eq('user_id', userId)
          .eq('video_id', videoId)
          .maybeSingle();

      return response != null;
    } catch (e) {
      return false;
    }
  }

  Future<void> addToFavorites(String userId, String videoId) async {
    await _supabase.from(AppConstants.favoritesTable).insert({
      'user_id': userId,
      'video_id': videoId,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  Future<void> removeFromFavorites(String userId, String videoId) async {
    await _supabase
        .from(AppConstants.favoritesTable)
        .delete()
        .eq('user_id', userId)
        .eq('video_id', videoId);
  }

  Future<int> getFavoritesCount(String userId) async {
    try {
      final response = await _supabase
          .from(AppConstants.favoritesTable)
          .select()
          .eq('user_id', userId);

      return response.length;
    } catch (e) {
      return 0;
    }
  }
}