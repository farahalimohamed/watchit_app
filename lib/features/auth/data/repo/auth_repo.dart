import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/user_model.dart';

class AuthRepo {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<UserModel?> getCurrentUser() async {
    try {
      final session = _supabase.auth.currentSession;
      if (session == null) return null;

      final user = session.user;

      // Get user data from users table
      final response = await _supabase
          .from(AppConstants.usersTable)
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (response != null) {
        return UserModel.fromJson(response);
      }

      // Return basic user if not found in table
      return UserModel(
        id: user.id,
        email: user.email ?? '',
        username: user.userMetadata?['username'] ?? user.email?.split('@').first ?? '',
        createdAt: DateTime.now(),
      );
    } catch (e) {
      return null;
    }
  }

  Future<UserModel> signIn(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email.trim().toLowerCase(),
        password: password,
      );

      final user = response.user;
      if (user == null) throw Exception('Invalid email or password');

      // Get or create user in users table
      final existingUser = await _supabase
          .from(AppConstants.usersTable)
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (existingUser != null) {
        return UserModel.fromJson(existingUser);
      }

      // Create new user record
      final newUser = {
        'id': user.id,
        'email': user.email,
        'username': user.userMetadata?['username'] ?? user.email?.split('@').first,
        'created_at': DateTime.now().toIso8601String(),
      };

      await _supabase.from(AppConstants.usersTable).insert(newUser);

      return UserModel(
        id: user.id,
        email: user.email ?? email,
        username: user.userMetadata?['username'] ?? email.split('@').first,
        createdAt: DateTime.now(),
      );
    } on AuthException catch (e) {
      throw Exception(_getAuthErrorMessage(e.message));
    } catch (e) {
      throw Exception('Sign in failed: $e');
    }
  }

  Future<UserModel> signUp(String email, String password, String username) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email.trim().toLowerCase(),
        password: password,
        data: {
          'username': username.trim(),
          'email': email.trim().toLowerCase(),
        },
      );

      final user = response.user;
      if (user == null) throw Exception('Failed to create account');

      // Create user record in users table
      final newUser = {
        'id': user.id,
        'email': email.trim().toLowerCase(),
        'username': username.trim(),
        'created_at': DateTime.now().toIso8601String(),
      };

      await _supabase.from(AppConstants.usersTable).insert(newUser);

      return UserModel(
        id: user.id,
        email: email,
        username: username,
        createdAt: DateTime.now(),
      );
    } on AuthException catch (e) {
      throw Exception(_getAuthErrorMessage(e.message));
    } catch (e) {
      throw Exception('Sign up failed: $e');
    }
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  String _getAuthErrorMessage(String message) {
    final msg = message.toLowerCase();
    if (msg.contains('invalid login credentials')) {
      return 'Invalid email or password';
    } else if (msg.contains('email')) {
      return 'Invalid email address';
    } else if (msg.contains('password')) {
      return 'Password must be at least 6 characters';
    } else if (msg.contains('already registered')) {
      return 'Email already registered';
    }
    return message;
  }
}