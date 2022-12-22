import 'package:flutter/material.dart';
import 'package:flutterdemo/common/password_reset.dart';
import 'package:flutterdemo/driver_pages/driver_home/driver_home.dart';
import 'package:flutterdemo/driver_pages/signup_page/signup_page_driver.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:sign_button/sign_button.dart';

import '../../constants/constants.dart';

class LoginPageDriver extends StatefulWidget {
  const LoginPageDriver({Key? key}) : super(key: key);

  @override
  State<LoginPageDriver> createState() => _LoginPageDriverState();
}

class _LoginPageDriverState extends State<LoginPageDriver> {
  bool checkBoxVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: "SaathChalo"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, right: 130),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          )),
                      Text(" as Driver", style: TextStyle(fontSize: 28)),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 138),
                  child: Text("Please login to continue",
                      style: TextStyle(fontSize: 17)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32, right: 32, left: 32),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffDCDEDF))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffDCDEDF))),
                          labelText: 'E-mail',
                          hintText: 'e.g. john@gmail.com',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Color(0xffDCDEDF))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Color(0xffDCDEDF))),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    children: [
                      Checkbox(
                          value: checkBoxVal,
                          side: const BorderSide(color: Color(0xffDCDEDF)),
                          checkColor: Colors.white,
                          activeColor: MainColors.primary,
                          onChanged: (value) {
                            setState(() {
                              checkBoxVal = value as bool;
                            });
                          }),
                      const Text("Remember Me",
                          style: TextStyle(
                              fontSize: 13, color: MainColors.primary)),
                      const SizedBox(width: 100),
                      GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const PasswordReset())),
                          child: const Text("Forgot Password?",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff0000EE)))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: SizedBox(
                    width: 360,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const DriverHome())),
                        child: const Text("Login",
                            style: TextStyle(fontSize: 18))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
                  child: Row(
                    children: const [
                      Expanded(child: Divider(color: Colors.black)),
                      Text("   Or Login With    "),
                      Expanded(child: Divider(color: Colors.black)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInButton.mini(
                        buttonType: ButtonType.facebook,
                        onPressed: () {},
                      ),
                      SignInButton.mini(
                        buttonType: ButtonType.google,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Do not have an account?"),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignupDriver()));
                        },
                        child: const Text("Sign Up",
                            style: TextStyle(
                                fontSize: 15,
                                color: MainColors.primary,
                                fontWeight: FontWeight.w900)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
