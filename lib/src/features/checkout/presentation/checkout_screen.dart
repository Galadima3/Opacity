import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opacity/src/constants/image_url.dart';
import 'package:opacity/src/features/checkout/presentation/widgets/fancy_row_widget.dart';
import 'package:opacity/src/features/checkout/presentation/widgets/shop_button.dart';
import 'package:opacity/src/features/checkout/presentation/widgets/shop_item_widget.dart';
import 'package:opacity/src/features/kyc_feature/presentation/screens/kyc_screen.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => context.pop()),
      ),
      body: Column(
        children: [
          const FancyRowWidget(
            labelText: "Shipping Address",
          ),
          ListTile(
            title: Text(
              "Tiara Williams",
              style: TextStyle(fontSize: 16.sp),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "5, Ajayi road, Ogba, Lagos, Nigeria",
                  style: TextStyle(fontSize: 16.sp),
                ),
                Text(
                  "08016749739",
                  style: TextStyle(fontSize: 16.sp),
                )
              ],
            ),
            tileColor: Colors.white12,
          ),
          const FancyRowWidget(
            labelText: "Order Summary",
          ),
          ShopItemWidget(
            clothDetail: const [
              "Green casual top",
              "L",
              "\$15",
            ],
            imageLink: shirt1Url,
          ),
          ShopItemWidget(
            clothDetail: const [
              "Blue casual top",
              "XL",
              "\$25",
            ],
            imageLink: shirt2Url,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Column 1
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Subtotal",
                  ).withStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                  const Text(
                    "Discount",
                  ).withStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                  const Text("Total")
                      .withStyle(fontSize: 20.sp, fontWeight: FontWeight.w400)
                ],
              ),
              //Column 2
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "\$40",
                  ).withStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                  const Text(
                    "\$0",
                  ).withStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                  const Text("\$40")
                      .withStyle(fontSize: 20.sp, fontWeight: FontWeight.w400)
                ],
              )
            ],
          ).withPadding(const EdgeInsets.symmetric(horizontal: 15)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          const ShopButton(text: "Proceed to Payment")
        ],
      ),
    );
  }
}

// extension TextExtension on Text {
//   Text customText() {
//     return Text(
//       data ?? '',
//       style: style?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
//     );
//   }
// }

extension CustomText on Text {
  Text withStyle({
    required double fontSize,
    required FontWeight fontWeight,
  }) =>
      Text(
        data ?? "",
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      );
}
