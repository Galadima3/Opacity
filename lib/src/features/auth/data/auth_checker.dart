import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opacity/src/features/auth/data/auth_repository.dart';
import 'package:opacity/src/features/auth/presentation/screens/home_screen.dart';
import 'package:opacity/src/features/auth/presentation/screens/landing_screen.dart';
import 'package:opacity/src/features/auth/presentation/screens/register_screen.dart';


class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<User?>(
      stream: ref.read(authStateProvider.stream),
      builder: (context, snapshot) {
        
        if (snapshot.hasError) {
          log(snapshot.error.toString()); // Log the error for debugging
          return const LandingScreen();
        }

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            // This shouldn't happen in most cases, but handle it if needed
            return const SizedBox(); // Or a placeholder widget
          case ConnectionState.waiting:
            return const SafeArea(
              child: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          case ConnectionState.active:
            final user = snapshot.data;
            return user != null ? const HomeScreen() : const RegisterScreen();
          case ConnectionState.done:
            // This state is unlikely for most streams, but handle it if necessary
            return const SizedBox(); // Or a placeholder widget
        }
      },
    );
  }
}
