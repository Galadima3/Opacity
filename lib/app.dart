import 'package:flutter/material.dart';
import 'package:opacity/src/features/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/features/auth/presentation/screens/splash_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool? showHome;

  @override
  void initState() {
    super.initState();
    _getShowHome();
  }

  Future<void> _getShowHome() async {
    final prefs = await SharedPreferences.getInstance();
    final showHome = prefs.getBool('showHome') ?? false;
    setState(() {
      this.showHome = showHome;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: unnecessary_null_comparison
      body: showHome != null
          ? (showHome! ? const SplashScreen() : const OnboardingScreen())
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
