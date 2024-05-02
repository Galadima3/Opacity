import 'dart:developer';
import 'package:email_validator/email_validator.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opacity/src/features/kyc_feature/presentation/widgets/kyc_button.dart';
import 'package:opacity/src/routing/route_paths.dart';

class KYCScreen extends StatefulWidget {
  const KYCScreen({super.key});

  @override
  State<KYCScreen> createState() => _KYCScreenState();
}

class _KYCScreenState extends State<KYCScreen> {
  final countryPicker = const FlCountryCodePicker(showDialCode: false);
  String pickedCountry = "Unknown";
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload KYC"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Step 1 of 3',
              style: TextStyle(fontSize: 15.sp),
            ).withPadding(const EdgeInsets.symmetric(horizontal: 10)),
            Text(
              'Personal Details',
              style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w600),
            ).withPadding(
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
            //Name
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ).withPadding(
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            ),
            //Email
            TextFormField(
              controller: emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => EmailValidator.validate(value!)
                  ? null
                  : "Please enter a valid email",
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ).withPadding(
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            ),
            //Phone Number
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ).withPadding(
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(pickedCountry),
                ElevatedButton(
                    onPressed: () async {
                      final picked =
                          await countryPicker.showPicker(context: context);

                      if (picked != null) {
                        setState(() {
                          pickedCountry = picked.name;
                        });
                        log(picked.name);
                      }
                    },
                    child: const Text('Select Country'))
              ],
            ),
            //Phone Number
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ).withPadding(
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            ),

            //Button
            GestureDetector(
              onTap: () =>
                  context.pushNamed(RoutePaths.proofofIdentityScreenRoute),
              child: const KYCButton(
                text: "Next",
              ).withPadding(const EdgeInsets.only(top: 20)),
            )
          ],
        ),
      ),
    );
  }
}



extension CustomPadding on Widget {
  Widget withPadding(EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }
}
