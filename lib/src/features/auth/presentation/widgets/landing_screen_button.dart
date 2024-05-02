import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingScreenButton extends StatelessWidget {
  final String text;
  final VoidCallback buttonFunction;
  const LandingScreenButton({
    super.key,
    required this.text,
    required this.buttonFunction,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        buttonFunction();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF191970),
        minimumSize: const Size(125, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
