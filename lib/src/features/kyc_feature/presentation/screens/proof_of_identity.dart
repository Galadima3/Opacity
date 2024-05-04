import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opacity/src/features/kyc_feature/presentation/screens/kyc_screen.dart';
import 'package:opacity/src/features/kyc_feature/presentation/widgets/kyc_button.dart';
import 'package:opacity/src/features/kyc_feature/presentation/widgets/upload_widget.dart';
import 'package:opacity/src/routing/route_paths.dart';

class ProofOfIdentity extends ConsumerStatefulWidget {
  const ProofOfIdentity({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProofOfIdentityState();
}

class _ProofOfIdentityState extends ConsumerState<ProofOfIdentity> {
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 40.h,
            ),
            Text(
              "Upload KYC",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
            ).withPadding(const EdgeInsets.fromLTRB(10, 0, 0, 10)),
          Text(
            'Step 2 of 3',
            style: TextStyle(fontSize: 15.sp),
          ).withPadding(const EdgeInsets.symmetric(horizontal: 10)),
          Text(
            'Proof of Identity',
            style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w600),
          ).withPadding(
              const EdgeInsets.symmetric(horizontal: 10)),

          //RadioListTile Widget
          //Option 1
          RadioListTile(
            activeColor: const Color(0xFF4A0084),
            title: const Row(
              children: [
                Icon(Icons.fingerprint),
                SizedBox(width: 10),
                Text('ID Card')
              ],
            ),
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
            title: const Row(
              children: [
                Icon(Icons.assignment_ind),
                SizedBox(width: 10),
                Text('Driver\'s License')
              ],
            ),
            value: 2,
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          ),

          //Option 3
          RadioListTile(
            title: const Row(
              children: [
                Icon(Icons.language),
                SizedBox(width: 10),
                Text('Passport')
              ],
            ),
            value: 3,
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          ),
          SizedBox(
            height: 10.h,
          ),

          Text(
            'Upload ID Proof',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19.sp),
          ).withPadding(const EdgeInsets.all(10)),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UploadWidget(
                text: "Front",
              ),
              UploadWidget(
                text: "Back",
              ),
            ],
          ),
          SizedBox(
            height: height * 0.225.h,
          ),
          GestureDetector(
              onTap: () => context.pushNamed(RoutePaths.bankDetailsScreenRoute),
              child: const KYCButton(text: "Next"))
        ],
      ),
    );
  }
}
