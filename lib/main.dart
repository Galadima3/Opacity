import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opacity/src/features/auth/presentation/screens/landing_screen.dart';

import 'package:opacity/src/features/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(
    showHome: showHome,
  ));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({super.key, required this.showHome});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opacity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.urbanist().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF191970)),
        useMaterial3: true,
      ),
      //home: const LandingScreen(),
      home: showHome ? const LandingScreen() : const OnboardingScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
