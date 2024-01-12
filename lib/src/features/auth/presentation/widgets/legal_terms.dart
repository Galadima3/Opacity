import 'package:flutter/material.dart';

class LegalTerms extends StatelessWidget {
  const LegalTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'By continuing you agree to our ',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 0.60,
                  ),
                ),
                TextSpan(
                  text: 'Terms of Service',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 0.60,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'TrackPro services are subject to our',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 0.60,
                  ),
                ),
                TextSpan(
                  text: ' Privacy Policy',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 0.60,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
