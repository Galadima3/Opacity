import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAlert extends StatelessWidget {
  final BuildContext ctx;
  final Object e;
  const CustomAlert({super.key, required this.e, required this.ctx});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("An error occurred during Sign in."),
      content: Text(e.toString()),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
