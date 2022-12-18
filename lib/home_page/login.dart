import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/constants.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/home_page/sign_up.dart';
import 'package:flutterdemo/passenger_pages/passenger_home/passenger_home.dart';
import 'package:provider/provider.dart';
import '../../common/password_reset/password_reset.dart';
import '../../global_components/main_text_field.dart';
import '../global_components/main_text_form_field.dart';
import '../providers_repositories/current_user/current_user_provider.dart';
import 'home_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool checkBoxVal = false;
  bool isDriver = false;
  bool isPassenger = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: "SaathChalo"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only( left: 32),
                  child: Row(
                    children: const [
                      Text("Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(" Please login to proceed", style: TextStyle(fontSize: 28)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32, right: 32, left: 32),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                      MainTextFormField(
                      labelText: "Email",
                      hintText: "someone@someone.com",
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Field';
                        }
                        return null;
                      },
                      obscureText: false,
                      enableSuggestions: true,
                    ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: MainTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required Field";
                              }
                              return null;
                            },
                            controller: passwordController,
                            obscureText: true,
                            enableSuggestions: false,
                            labelText: 'Password',
                            hintText: '*****',
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40,top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const PasswordReset()));
                          },
                          child: const Text("Forgot Password?",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff0000EE)))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: SizedBox(
                    width: 360,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            String email=emailController.text;
                            email=email.replaceAll(' ', '');
                            String error = await context
                                .read<CurrentUserProvider>()
                                .signin(email, passwordController.text);
                            if (error != "") {
                              final snackBar = SnackBar(
                                content: Text(error),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              print(context.read<CurrentUserProvider>().currentCustomer.id,);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const HomePage(title: "Saath Chalo"),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text("Login",
                            style: TextStyle(fontSize: 18))),
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
                              builder: (context) => const Signup()));
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
