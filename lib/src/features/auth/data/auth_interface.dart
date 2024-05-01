import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthInterface {
  //sign in
  Future<User?> signInEmailAndPassword(
      {required String email, required String password});

  //sign up
  Future<AuthResponse?> signUpEmailAndPassword({
    required String email,
    required String password,
    required String phoneNumber,
    required String displayName,
  });

  //sign out
  Future<void> signOut();
}
