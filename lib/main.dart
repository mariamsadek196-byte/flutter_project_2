import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/auth/sign%20in%20to%20your%20home.dart';
import 'package:flutter_application_1/feature/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignInScreen(),
    );
  }
}
