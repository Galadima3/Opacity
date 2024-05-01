import 'dart:developer';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    nameController.dispose();
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
            const Text(
              'Step 1 of 3',
              style: TextStyle(fontSize: 15),
            ).withPadding(const EdgeInsets.symmetric(horizontal: 10)),
            const Text(
              'Personal Details',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ).withPadding(
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
            //Name
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ).withPadding(
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
            ),
            //Email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ).withPadding(
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
            ),
            //Phone Number
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ).withPadding(
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
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
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ).withPadding(
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
            ),

            //Button
            Center(child: ElevatedButton(onPressed: (){}, child: const Text("Next"),))
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
      child: this, // Reference the original widget
    );
  }
}
