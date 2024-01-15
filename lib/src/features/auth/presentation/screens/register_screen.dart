// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:email_validator/email_validator.dart';
import 'package:opacity/main.dart';
import 'package:opacity/src/common_widgets/fancy_button.dart';
import 'package:opacity/src/features/auth/data/auth_repository.dart';
import 'package:opacity/src/features/auth/data/firestore_repository.dart';
import 'package:opacity/src/features/auth/presentation/widgets/legal_terms.dart';
import 'package:opacity/src/features/auth/presentation/widgets/sign_in_icon.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  String phoneNumber = '';
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  Future<User?> onRegisterSubmit({
    required WidgetRef ref,
    required String email,
    required String password,
    required String username,
    required String phoneNumber,
  }) async {
    setState(() => isLoading = true);
    try {
      final user =
          await ref.read(authRepositoryProvider).signUp(email, password);

      // Ensure that user is not null before proceeding
      if (user != null) {
        await ref.read(firestoreRepositoryProvider).storeUserDataInFirestore(
            email: email,
            username: username,
            phoneNumber: phoneNumber,
            userID: user.uid);
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return const HomeScreen();
        },
      ));

      return user;
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text(
                "An error occurred during registration. Please try again."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
      log("Error during registration: $e");

      return null; // Return null in case of an error
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //email
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
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
              padding:
                  const EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
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
              padding:
                  const EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
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
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
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
            GestureDetector(
              onTap: () => onRegisterSubmit(
                  email: emailController.text,
                  password: passwordController.text,
                  phoneNumber: phoneNumber,
                  username: usernameController.text,
                  ref: ref),
              child: FancyButton(
                inputWidget: isLoading
                    ? Transform.scale(
                        scale: 0.5,
                        child: const CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.white),
                      )
                    : const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
              child: SizedBox(height: 50, child: LegalTerms()),
            )
          ],
        ),
      ),
    );
  }
}
