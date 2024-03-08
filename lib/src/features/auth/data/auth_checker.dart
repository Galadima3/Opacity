import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opacity/src/features/auth/data/auth_repository.dart';
import 'package:opacity/src/features/auth/presentation/screens/home_screen.dart';
import 'package:opacity/src/features/auth/presentation/screens/landing_screen.dart';
import 'package:opacity/src/features/auth/presentation/screens/register_screen.dart';
import 'package:opacity/src/features/auth/presentation/screens/sign_in_screen.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.read(authStateProvider);
    return authState.when(
      data: (user) {
        if (user != null) {
          print(user.email);
          return const HomeScreen();
        }
        return const RegisterScreen();
      },
      error: (e, trace) => const LandingScreen(),
      loading: () => const SafeArea(
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
