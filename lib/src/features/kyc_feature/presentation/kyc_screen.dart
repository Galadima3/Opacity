import 'package:flutter/material.dart';

class KYCScreen extends StatefulWidget {
  const KYCScreen({super.key});

  @override
  State<KYCScreen> createState() => _KYCScreenState();
}

class _KYCScreenState extends State<KYCScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text('data')
        ],
      ));
  }
}