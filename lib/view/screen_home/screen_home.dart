import 'package:api_auth/controllers/shared_preference.controller.dart';
import 'package:api_auth/view/screen_login/screen_login.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(233, 248, 248, 0.812),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset("asset/hi.gif")),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
              label: const Text("Logout"),
              onPressed: () {
                SharedPreference().deleteUser();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => ScreenLogin(),
                    ),
                    (route) => false);
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
      ),
    );
  }
}
