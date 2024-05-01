import 'package:flutter/material.dart';
import 'package:opacity/src/features/auth/presentation/screens/home_screen.dart';
import 'package:opacity/src/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final vizier = Supabase.instance.client.auth.currentSession;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1500), () {
      final session = Supabase.instance.client.auth.currentSession;

      if (session == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SignInScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 65, right: 10),
          child: Image.asset('assets/images/trackpro.png'),
        )
      ),
    );
  }
}
