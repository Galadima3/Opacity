import 'dart:developer';

import 'package:opacity/src/features/auth/data/auth_interface.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepository implements AuthInterface {
  final Supabase _supabase = Supabase.instance;
  
  @override
  Future<User?> signInEmailAndPassword(String email, String password) async {
    try {
      final response = await _supabase.client.auth
          .signInWithPassword(password: password, email: email);
      return response.user;
    } catch (e) {
      // Handle sign in errors here
      if (e is AuthException) {
        // You can access specific Supabase error messages here
        log(e.message); // Example: print error message to console
      } else {
        // Handle other types of exceptions
        log("An unexpected error occurred: $e"); // Example: generic error message
      }
    }
    return null; // Indicate sign in failure if there's an exception
  }

  @override
  Future<void> signOut() async {
    await _supabase.client.auth.signOut();
  }

  @override
  Future<AuthResponse?> signUpEmailAndPassword(String email, String password,
      String phoneNumber, String displayName) async {
    try {
      final rex = await _supabase.client.auth
          .signUp(password: password, email: email, data: {
        'phoneNumber': phoneNumber,
        'displayName': displayName,
      });
      return rex;
    } catch (e) {
      // Handle sign in errors here
      if (e is AuthException) {
        // You can access specific Supabase error messages here
        log(e.message); // Example: print error message to console
      } else {
        // Handle other types of exceptions
        log("An unexpected error occurred: $e"); // Example: generic error message
      }
    }
    return null;
  }
}
