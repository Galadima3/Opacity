// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:opacity/src/common_widgets/fancy_button.dart';

import 'package:opacity/src/routing/route_paths.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80),
          const Text(
            'Tracking made easy',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(30, 30, 30, 1),
              fontSize: 29.5,
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: 1.08,
            ),
          ),
          const SizedBox(height: 5),
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Stay in control of your products with TrackPro',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1E1E1E),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 65, right: 10, top: 50),
              child: Image.asset("assets/images/trackpro.png")),
          const Text(
            'TrackPro',
            style: TextStyle(
              color: Color(0xFF191970),
              fontSize: 36,
              fontStyle: FontStyle.italic,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 90),
          //Button
          GestureDetector(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('showHome', true);
              if (!mounted) return;
              context.pushReplacementNamed(RoutePaths.landingScreenRoute);
            },
            child: const FancyButton(
              inputWidget: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Get started ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
