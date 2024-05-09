import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opacity/src/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:opacity/src/features/checkout/presentation/widgets/shop_button.dart';
import 'package:opacity/src/features/kyc_feature/presentation/screens/kyc_screen.dart';

List rand = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS10LvOE7rDb-BGeLdUPXd5qeQ_tPxOL08mxKhBR7anhg&s",
  "https://www.pngitem.com/pimgs/m/1-18325_logo-mastercard-hd-png-download.png",
  "https://cdn.exchangewire.com/wp-content/uploads/2020/05/Exchangewire_VerveGroup_only.jpg",
];

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => context.pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Select a payment method")
                  .withStyle(fontSize: 24.sp, fontWeight: FontWeight.w400),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...rand.map(
                    (e) => Container(
                      width: 110.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(e))),
                    ),
                  ),
                ],
              ),
              TextField(
                //controller: accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Name on Card',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ).withPadding(
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              ),
              TextField(
                //controller: accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  prefixIcon: const Icon(Icons.credit_card),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ).withPadding(
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 180.w,
                    height: 75.h,
                    child: TextField(
                      maxLength: 5, // Limit input to 5 characters (MM/YY)
                      keyboardType:
                          TextInputType.datetime, // Show a date picker keyboard
                      decoration: InputDecoration(
                        labelText: 'MM/YY',
                        prefixIcon: const Icon(Icons.calendar_month),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        counterText: '', // Hide character count
                      ),
                    ).withPadding(
                      const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15),
                    ),
                  ),
                  SizedBox(
                    width: 180.w,
                    height: 75.h,
                    child: TextField(
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ).withPadding(
                      const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h), //SizedBox
              Row(
                children: [
                  Checkbox(
                    value: _value,
                    onChanged: (bool? value) {
                      setState(() {
                        _value = value ?? false;
                      });
                    },
                  ),
                  const Text("Save this card")
                      .withStyle(fontSize: 16, fontWeight: FontWeight.w400)
                ],
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height * 0.25).h,
              ),

              const ShopButton(text: "Pay Now")
            ],
          ),
        ),
      ),
    );
  }
}
