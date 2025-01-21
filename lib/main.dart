import 'package:flutter/material.dart';

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
      ),
      home: Container(),
    );
  }
}
