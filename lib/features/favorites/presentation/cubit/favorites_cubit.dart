import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/features/favorites/presentation/cubit/favorites_state.dart';
import '../../data/repo/favorites_repo.dart';
import '../../data/models/favorite_model.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo _repo;

  FavoritesCubit(this._repo) : super(FavoritesInitial());

  Future<void> loadFavorites(String userId) async {
    emit(FavoritesLoading());
    try {
      final favorites = await _repo.getFavorites(userId);
      emit(FavoritesLoaded(favorites));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  Future<void> toggleFavorite(String userId, String videoId) async {
    final isFav = await _repo.isFavorite(userId, videoId);

    if (isFav) {
      await _repo.removeFromFavorites(userId, videoId);
      emit(FavoriteRemoved(videoId));
    } else {
      await _repo.addToFavorites(userId, videoId);
      emit(FavoriteAdded(videoId));
    }

    // Reload favorites
    await loadFavorites(userId);
  }

  Future<void> addToFavorites(String userId, String videoId) async {
    await _repo.addToFavorites(userId, videoId);
    await loadFavorites(userId);
    emit(FavoriteAdded(videoId));
  }

  Future<void> removeFromFavorites(String userId, String videoId) async {
    await _repo.removeFromFavorites(userId, videoId);
    await loadFavorites(userId);
    emit(FavoriteRemoved(videoId));
  }

  Future<bool> checkIsFavorite(String userId, String videoId) async {
    return await _repo.isFavorite(userId, videoId);
  }
}