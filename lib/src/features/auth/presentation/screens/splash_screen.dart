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
    Future.delayed(const Duration(milliseconds: 1500)).then((value){
      vizier?.user == null ? Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return const SignInScreen();
      },)) : Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      },));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.flutter_dash,
          size: 40,
        ),
      ),
    );
  }
}
