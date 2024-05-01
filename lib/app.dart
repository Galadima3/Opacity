import 'package:flutter/material.dart';
import 'package:opacity/src/features/onboarding/onboarding_screen.dart';

import 'src/features/auth/presentation/screens/splash_screen.dart';

class App extends StatefulWidget {
  final bool showHome;
  const App({super.key, required this.showHome});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.showHome ? const SplashScreen() : const OnboardingScreen(),
    );
  }
}
