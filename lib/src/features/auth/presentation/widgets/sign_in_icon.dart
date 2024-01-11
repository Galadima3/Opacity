import 'package:flutter/material.dart';

class SignInIcon extends StatelessWidget {
  final String imageUrl;
  const SignInIcon({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 50,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imageUrl)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)),
    );
  }
}
