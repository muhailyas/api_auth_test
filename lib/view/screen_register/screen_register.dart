import 'package:api_auth/controllers/auth_services.dart';
import 'package:api_auth/view/screen_login/screen_login.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/text_feild_widget.dart';

class ScreenRegister extends StatelessWidget {
  ScreenRegister({super.key});
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
          body: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFormFieldWidget(
                  controller: firstNameController,
                  label: 'Firstname',
                ),
                kHeight10,
                TextFormFieldWidget(
                  controller: lastNameController,
                  label: 'Lastname',
                ),
                kHeight10,
                TextFormFieldWidget(
                  controller: usernameController,
                  label: 'Username',
                ),
                kHeight10,
                TextFormFieldWidget(
                  controller: emailController,
                  label: 'Email',
                ),
                kHeight10,
                TextFormFieldWidget(
                  controller: passwordController,
                  label: 'Password',
                ),
                kHeight10,
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        validate(context);
                      }
                    },
                    style: const ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(410, 55)),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                kHeight10,
                Align(
                    alignment: const Alignment(-0.8, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ScreenLogin(),
                        ));
                      },
                      child: Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: Colors.blue.withOpacity(0.9).withRed(5)),
                      ),
                    )),
                kHeight20
              ],
            ),
          ),
        ),
      ),
    );
  }

  validate(context) async {
    final String firstName = firstNameController.text;
    final String lastName = lastNameController.text;
    final String email = emailController.text;
    final String username = usernameController.text;
    final String password = passwordController.text;
    print("started");
    final newUser = {
      "email": email,
      "username": username,
      "password": password,
      "name": {"firstname": firstName, "lastname": lastName}
    };
    await AuthServices().registerUser(newUser, context);
    print("return get");
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ScreenLogin(),
    ));
  }
}
