import '../../data/models/favorite_model.dart';

abstract class FavoritesState {
  const FavoritesState();

  @override
  List<Object?> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<FavoriteModel> favorites;
  const FavoritesLoaded(this.favorites);

  @override
  List<Object?> get props => [favorites];
}

class FavoritesError extends FavoritesState {
  final String message;
  const FavoritesError(this.message);

  @override
  List<Object?> get props => [message];
}

class FavoriteAdded extends FavoritesState {
  final String videoId;
  const FavoriteAdded(this.videoId);

  @override
  List<Object?> get props => [videoId];
}

class FavoriteRemoved extends FavoritesState {
  final String videoId;
  const FavoriteRemoved(this.videoId);

  @override
  List<Object?> get props => [videoId];
}