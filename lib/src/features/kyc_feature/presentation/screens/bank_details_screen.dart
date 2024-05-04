import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opacity/src/features/kyc_feature/presentation/screens/kyc_screen.dart';
import 'package:opacity/src/features/kyc_feature/presentation/widgets/kyc_button.dart';

class BankDetailsScreen extends ConsumerStatefulWidget {
  const BankDetailsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BankDetailsScreenState();
}

class _BankDetailsScreenState extends ConsumerState<BankDetailsScreen> {
  final accountNameController = TextEditingController();
  final accountNumberController = TextEditingController();
  @override
  void dispose() {
    accountNameController.dispose();
    accountNumberController.dispose();

    super.dispose();
  }

  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 40.h
            ),
            Text(
              "Upload KYC",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
            ).withPadding(const EdgeInsets.fromLTRB(10, 0, 0, 10)),
          Text(
            'Step 3 of 3',
            style: TextStyle(fontSize: 15.sp),
          ).withPadding(const EdgeInsets.symmetric(horizontal: 10)),
          Text(
            'Bank Details',
            style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w600),
          ).withPadding(
              const EdgeInsets.symmetric(horizontal: 10)),

          //RadioListTile Widget
          //Option 1
          RadioListTile(
            activeColor: const Color(0xFF4A0084),
            title: const Text("Savings"),
            value: 1,
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          ),

          //Option 2
          RadioListTile(
            title: const Text("Current"),
            value: 2,
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          ),

          TextField(
            controller: accountNameController,
            decoration: InputDecoration(
              labelText: 'Account Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ).withPadding(
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          ),
          TextField(
            controller: accountNumberController,
            decoration: InputDecoration(
              labelText: 'Account Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ).withPadding(
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          ),

          SizedBox(
            height: height * 0.225.h,
          ),
           const KYCButton(text: "Submit")
        ],
      ),
    );
  }
}
