import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final _auth = FirebaseAuth.instance;

  //getters
  User? get userDetails => _auth.currentUser;
  Stream<User?> get authStateChange => _auth.idTokenChanges();

  Future<User?> signInWithEmailAndPassword(
      //sign in method
      String email,
      String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('Sign in successful');
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('User not found');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Wrong password');
      } else {
        log(e.message ?? 'No error occured');
        throw AuthException('An error occured. Please try again later');
      }
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      log('Sign up successful');
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  //sign out method
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    return message;
  }
}

//Providers
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepositoryProvider).authStateChange;
});

final userDetailsProvider = Provider.autoDispose<User?>((ref) {
  return ref.read(authRepositoryProvider).userDetails;
});
