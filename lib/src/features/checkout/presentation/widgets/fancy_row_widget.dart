import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FancyRowWidget extends StatelessWidget {
  final String labelText;
  const FancyRowWidget({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            labelText,
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
          ),
          ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xff191970))),
            child: Text(
              "Edit",
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          )
        ],
      ),
    );
  }
}
