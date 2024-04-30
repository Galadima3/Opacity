import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthInterface {
  //sign in
  Future<User?> signInEmailAndPassword(String email, String password);

  //sign up
  Future<AuthResponse?> signUpEmailAndPassword(
      String email, String password, String phoneNumber, String displayName);

  //sign out
  Future<void> signOut();
}
