import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opacity/src/features/auth/domain/user_model.dart';

class FirestoreRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> storeUserDataInFirestore(
      {required String email,
      required String username,
      required String phoneNumber,
      required String userID}) async {
    try {
      await _firestore.collection('users').doc(userID).set({
        'email': email,
        'username': username,
        'phoneNumber': phoneNumber,
        'time': DateTime.now()
      });
    } catch (e) {
      throw Exception('Failed to store user data in Firestore: $e');
    }
  }

  Future<UserModel?> getLoggedInUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final doc = await _firestore
            .collection('users')
            .doc(_auth.currentUser?.uid)
            .get();

        if (doc.exists) {
          final data = doc.data() as Map<String, dynamic>;
          return UserModel.fromMap(data, doc.id);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      log('Error fetching user data from Firestore: $e');
      return null;
    }
  }
}

//providers
final firestoreRepositoryProvider = Provider<FirestoreRepository>((ref) {
  return FirestoreRepository();
});

final userInfoProvider = FutureProvider.autoDispose<UserModel?>((ref) async {
  return ref.read(firestoreRepositoryProvider).getLoggedInUserData();
});
