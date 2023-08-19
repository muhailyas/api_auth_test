// ignore_for_file: use_build_context_synchronously

import 'package:api_auth/view/screen_getstarted/screen_getstarted.dart';
import 'package:api_auth/view/screen_home/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    checkLogin(context);
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
            0.1,
            0.5,
            0.9,
          ],
              colors: [
            Colors.orange,
            Colors.white,
            Colors.green
          ])),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            "Welcome to Ooty Nice to meet you",
            style: TextStyle(fontSize: 25, color: Colors.blue,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPreferences.getString('token');
    if (userLoggedIn == null) {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const ScreenGetStarted(),
        ),
        (route) => false,
      );
    } else {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const ScreenHome(),
        ),
        (route) => false,
      );
    }
  }
}
