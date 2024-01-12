import 'package:flutter/material.dart';
import 'package:opacity/src/features/auth/presentation/screens/register_screen.dart';

import 'package:opacity/src/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:opacity/src/features/auth/presentation/widgets/landing_screen_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LandingScreenButton(
                    text: 'Sign up',
                    buttonFunction: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()),
                        )),
                LandingScreenButton(
                    text: 'Log in',
                    buttonFunction: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()),
                      );
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
