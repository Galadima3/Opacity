import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opacity/src/routing/route_paths.dart';
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
        context.pushReplacementNamed(RoutePaths.loginScreenRoute);
      } else {
        context.pushReplacementNamed(RoutePaths.homeScreenRoute);
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
        child: Image.asset(
          'assets/images/trackpro.png',
          height: 360.h,
          width: 324.w,
        ),
      )),
    );
  }
}
