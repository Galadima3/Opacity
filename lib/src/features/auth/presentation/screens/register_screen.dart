import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:email_validator/email_validator.dart';
import 'package:opacity/src/common_widgets/fancy_button.dart';
import 'package:opacity/src/features/auth/presentation/widgets/legal_terms.dart';
import 'package:opacity/src/features/auth/presentation/widgets/sign_in_icon.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //email
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              validator: (value) => EmailValidator.validate(value!)
                  ? null
                  : "Please enter a valid email",
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          //Phone Number
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
            child: IntlPhoneField(
              disableLengthCheck: true,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'NG',
              onChanged: (phone) {
                setState(() => phoneNumber = phone.completeNumber);
              },
            ),
          ),
          //Username
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.name,
              controller: usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Can\'t be empty';
                }
                if (value.length < 4) {
                  return 'Username is too short';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Username',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          //Password
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              controller: passwordController,
              obscureText: true,
              validator: (value) =>
                  value!.length < 6 ? "Password should be longer" : null,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: const Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const Text.rich(
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.80,
              ),
              TextSpan(text: 'Registered already?', children: <InlineSpan>[
                TextSpan(
                  text: ' Sign in',
                  style: TextStyle(
                    color: Color(0xFF191970),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ])),

          const SizedBox(height: 15.5),
          const FancyButton(
            inputWidget: Text(
              'Sign up',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(height: 15),
          //Divider
          const Row(
            children: <Widget>[
              Expanded(
                  child: Divider(
                thickness: 1.5,
              )),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Or continue with"),
              ),
              Expanded(
                child: Divider(),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SignInIcon(imageUrl: 'assets/images/google.png'),
              SignInIcon(imageUrl: 'assets/images/apple.png'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
            child: SizedBox(height: 50, child: LegalTerms()),
          )
        ],
      ),
    );
  }
}
