
import 'package:youtube_clone/features/home/data/models/video_model.dart';

abstract class HomeState{
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<VideoModel> videos;
  const HomeLoaded(this.videos);

  @override
  List<Object?> get props => [videos];
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}