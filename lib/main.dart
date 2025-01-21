import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/sign_up/sign_up_screen.dart';

void main() {
  runApp(const TiktokApp());
}

class TiktokApp extends StatelessWidget {
  const TiktokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tiktok clone',
        theme: ThemeData(
          primaryColor: const Color(0xFF5D8736),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: SignUpScreen());
  }
}
