import 'package:api_auth/view/screen_splash/screen_splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ApiAuth());
}

class ApiAuth extends StatelessWidget {
  const ApiAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenSplash(),
    );
  }
}
