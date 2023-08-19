import 'package:api_auth/view/constants/constants.dart';
import 'package:api_auth/view/screen_home/screen_home.dart';
import 'package:api_auth/view/screen_register/screen_register.dart';
import 'package:flutter/material.dart';
import '../../controllers/auth_services.dart';
import '../widgets/text_feild_widget.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  bool changeState = false;
  final TextEditingController usernameController =
      TextEditingController(text: 'johnd');

  final TextEditingController passwordController =
      TextEditingController(text: 'm38rmF\$');

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
                  controller: usernameController,
                  label: 'Username',
                ),
                kHeight10,
                TextFormFieldWidget(
                  controller: passwordController,
                  label: 'Password',
                ),
                kHeight10,
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: changeState
                      ? ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll(Size(410, 55)),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white)),
                          child: const CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              setState(() {
                                changeState = !changeState;
                              });
                              await validate(context);
                              setState(() {
                                changeState = !changeState;
                              });
                            }
                          },
                          style: const ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll(Size(410, 55)),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white)),
                          child: const Text(
                            "Login",
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
                          builder: (context) => ScreenRegister(),
                        ));
                      },
                      child: Text(
                        "Don't have an account?",
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
    final String username = usernameController.text;
    final String password = passwordController.text;
    final user = {'username': username, 'password': password};
    final bool result = await AuthServices().loginUser(user, context);
    if (result) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ScreenHome(),
      ));
    }
  }
}
