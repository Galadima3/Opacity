import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadWidget extends StatelessWidget {
  final String text;
  const UploadWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 129.h,
      width: 181.w,
      decoration: BoxDecoration(
        color: const Color(0xFF4A0084),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.photo_camera_front,
              color: Colors.white,
              size: 40,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 24.sp),
            )
          ],
        ),
      ),
    );
  }
}
