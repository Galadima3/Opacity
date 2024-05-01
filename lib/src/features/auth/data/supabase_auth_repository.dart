import 'dart:developer';
import 'package:opacity/src/features/auth/data/auth_interface.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SupabaseAuthRepository implements AuthInterface {
  final Supabase _supabase = Supabase.instance;

  //getter
  User? get userDetails => _supabase.client.auth.currentUser;

  @override
  Future<User?> signInEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await _supabase.client.auth
          .signInWithPassword(password: password, email: email);
      return response.user;
    } catch (e) {
      if (e is AuthException) {
        log(e.message);
      } else {
        log("An unexpected error occurred: $e");
      }
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    await _supabase.client.auth.signOut();
  }

  @override
  Future<AuthResponse?> signUpEmailAndPassword(
      {required String email,
      required String password,
      required String phoneNumber,
      required String displayName}) async {
    try {
      final rex = await _supabase.client.auth
          .signUp(password: password, email: email, data: {
        'phoneNumber': phoneNumber,
        'displayName': displayName,
      });
      return rex;
    } catch (e) {
      if (e is AuthException) {
        log(e.message);
      } else {
        log("An unexpected error occurred: $e");
      }
    }
    return null;
  }
}

final supabaseAuthProvider = Provider<SupabaseAuthRepository>((ref) {
  return SupabaseAuthRepository();
});
final userDetailsProvider = Provider.autoDispose<User?>((ref) {
  return ref.read(supabaseAuthProvider).userDetails;
});
