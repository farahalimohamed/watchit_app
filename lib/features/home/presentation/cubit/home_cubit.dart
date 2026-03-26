import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/features/home/presentation/cubit/home_state.dart';
import '../../data/repo/video_repo.dart';


class HomeCubit extends Cubit<HomeState> {
  final VideoRepo _videoRepo;

  HomeCubit(this._videoRepo) : super(HomeInitial()) {
    loadVideos();
  }

  Future<void> loadVideos() async {
    emit(HomeLoading());
    try {
      final videos = await _videoRepo.getVideos();
      emit(HomeLoaded(videos));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}