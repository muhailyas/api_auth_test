import 'package:api_auth/view/screen_login/screen_login.dart';
import 'package:flutter/material.dart';

class ScreenGetStarted extends StatelessWidget {
  const ScreenGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>  ScreenLogin(),
                  ));
                },
                style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(250, 50)),
                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
