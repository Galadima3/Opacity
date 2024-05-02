import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInIcon extends StatelessWidget {
  final String imageUrl;
  const SignInIcon({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 50.w,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imageUrl)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r)),
    );
  }
}
