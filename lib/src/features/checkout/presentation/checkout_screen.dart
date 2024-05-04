import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
        //

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
        ],
      ),
    );
  }
}

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

extension TextStyleExtension on Widget {
  Widget withStyle(TextStyle style) {
    return DefaultTextStyle(
      style: style,
      child: this,
    );
  }
}
