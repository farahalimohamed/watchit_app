import 'package:youtube_clone/features/auth/data/models/user_model.dart';

abstract class AuthenticationState {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthenticationState {}

class AuthLoading extends AuthenticationState {}

class AuthAuthenticated extends AuthenticationState {
  final UserModel user;
  const AuthAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthenticationState {}

class AuthFailure extends AuthenticationState {
  final String message;
  const AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}