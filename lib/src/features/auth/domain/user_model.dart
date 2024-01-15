import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String username;
  final String phoneNumber;
  final DateTime time;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.time,
  });

  factory UserModel.fromMap(Map<String, dynamic> data, String id) {
    return UserModel(
      id: id,
      email: data['email'] ?? '',
      username: data['username'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      time: (data['time'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'phoneNumber': phoneNumber,
      'time': time,
    };
  }
}
