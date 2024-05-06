import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopButton extends StatelessWidget {
  final String text;
  const ShopButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60.h,
        width: 378.w,
        decoration: BoxDecoration(
          color: const Color(0xFF4A0084),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
        ),
      ),
    );
  }
}