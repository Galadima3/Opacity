import "package:flutter/material.dart";
import "package:opacity/src/common_widgets/fancy_button.dart";

import "package:opacity/src/features/auth/presentation/widgets/sign_in_icon.dart";

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
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
            const SizedBox(height: 7.5),
            const Text.rich(
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

            const SizedBox(height: 15.5),
            const FancyButton(
              inputWidget: Text(
                'Log in',
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
                  child: Text("Or log in with"),
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
    );
  }
}
