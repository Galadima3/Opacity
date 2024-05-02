import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opacity/src/features/auth/presentation/widgets/landing_screen_button.dart';
import 'package:opacity/src/routing/route_paths.dart';

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
           Text(
            'TrackPro',
            style: TextStyle(
              color: const Color(0xFF191970),
              fontSize: 36.sp,
              fontStyle: FontStyle.italic,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LandingScreenButton(
                    text: 'Sign up',
                    buttonFunction: () =>
                        context.pushNamed(RoutePaths.registerScreenRoute)),
                LandingScreenButton(
                    text: 'Log in',
                    buttonFunction: () =>
                        context.pushNamed(RoutePaths.loginScreenRoute)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
