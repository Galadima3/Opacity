import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:opacity/src/features/kyc_feature/presentation/screens/kyc_screen.dart';

class ShopItemWidget extends StatelessWidget {
  final List clothDetail;
  final String imageLink;
  const ShopItemWidget({
    super.key,
    required this.clothDetail,
    required this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 160.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                imageLink,
              ),
            ),
          ),
        ).withPadding(const EdgeInsets.all(15)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              clothDetail[0],
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            Text(clothDetail[1],
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400)),
            Text(clothDetail[2],
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500))
          ],
        )
      ],
    );
  }
}
