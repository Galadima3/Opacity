// ignore_for_file: use_build_context_synchronously
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:opacity/src/common_widgets/fancy_button.dart';
import 'package:opacity/src/features/auth/data/supabase_auth_repository.dart';

import 'package:opacity/src/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:opacity/src/features/auth/presentation/widgets/error_alert.dart';
import 'package:opacity/src/features/auth/presentation/widgets/sign_in_icon.dart';
import 'package:opacity/src/routing/route_paths.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  Future<AuthResponse?> onRegisterSubmit({
    required WidgetRef ref,
    required String email,
    required String password,
    required String username,
    required String phoneNumber,
  }) async {
    try {
      setState(() => isLoading = true);

      final user = await ref.read(supabaseAuthProvider).signUpEmailAndPassword(
            email: email,
            password: password,
            displayName: username,
            phoneNumber: phoneNumber,
          );
      if (user != null) {
        context.pushReplacementNamed(RoutePaths.homeScreenRoute);
      }
      return user;
    } catch (e) {
      log("Registration Error: $e");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlert(e: e);
        },
      );
      return null;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //email
            Padding(
              padding: const EdgeInsets.symmetric(vertical: .0, horizontal: 15),
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
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => context.pushNamed(RoutePaths.loginScreenRoute),
              child: Text.rich(
                  style: TextStyle(
                    color: const Color(0xFF1E1E1E),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.80,
                  ),
                  const TextSpan(
                      text: 'Registered already?',
                      children: <InlineSpan>[
                        TextSpan(
                          text: ' Sign in',
                          style: TextStyle(
                            color: Color(0xFF191970),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ])),
            ),

            SizedBox(height: 15.5.h),
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
                    : Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
              ),
            ),
            SizedBox(height: 15.h),
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
          ],
        ),
      ),
    );
  }
}
