import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  final Widget inputWidget;
  const FancyButton({super.key, required this.inputWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 315,
      decoration: BoxDecoration(
        color: const Color(0xFF191970),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: inputWidget),
    );
  }
}
