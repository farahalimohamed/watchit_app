import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/features/auth/presentation/cubit/auth_state.dart';
import '../../data/repo/auth_repo.dart';


class AuthCubit extends Cubit<AuthenticationState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial()) {
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    final user = await _authRepo.getCurrentUser();
    if (user != null) {
      emit(AuthAuthenticated(user));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await _authRepo.signIn(email, password);
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signUp(String email, String password, String username) async {
    emit(AuthLoading());
    try {
      final user = await _authRepo.signUp(email, password, username);
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

// signOut removed
}