// ignore_for_file: use_build_context_synchronously
import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:opacity/src/common_widgets/fancy_button.dart";
import "package:opacity/src/features/auth/data/supabase_auth_repository.dart";
import "package:opacity/src/features/auth/presentation/screens/home_screen.dart";
import "package:opacity/src/features/auth/presentation/screens/register_screen.dart";
import "package:opacity/src/features/auth/presentation/widgets/sign_in_icon.dart";
import "package:supabase_flutter/supabase_flutter.dart";

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<User?> onLoginSubmit({
    required WidgetRef ref,
    required String email,
    required String password,
  }) async {
    try {
      setState(() => isLoading = true);
      if (_formkey.currentState!.validate()) {
        final user =
            await ref.read(supabaseAuthProvider).signInEmailAndPassword(
                  email: email,
                  password: password,
                );
        if (user != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
        return user;
      }
    } catch (e) {
      log("Error during Login: $e");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("An error occurred during Sign in."),
            content: Text(e.toString()),
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
    } finally {
      setState(() => isLoading = false);
    }
    return null; // Return null if validation fails or in case of an error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 65, right: 10, top: 65),
                child: Image.asset(
                  "assets/images/trackpro.png",
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12.5),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const RegisterScreen();
                  },
                )),
                child: const Text.rich(
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: 0.80,
                    ),
                    TextSpan(
                        text: 'Don\'t have an account?',
                        children: <InlineSpan>[
                          TextSpan(
                            text: ' Sign up',
                            style: TextStyle(
                              color: Color(0xFF191970),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ])),
              ),

              const SizedBox(height: 25),
              Consumer(
                builder: (context, ref, child) {
                  return GestureDetector(
                    onTap: () => onLoginSubmit(
                        email: emailController.text,
                        password: passwordController.text,
                        ref: ref),
                    child: FancyButton(
                      inputWidget: isLoading
                          ? Transform.scale(
                              scale: 0.65,
                              child: const CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.white,
                              ),
                            )
                          : const Text(
                              'Log in',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                    ),
                  );
                },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
