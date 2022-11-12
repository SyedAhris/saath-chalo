import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

class LoginPageDriver extends StatefulWidget {
  const LoginPageDriver({Key? key}) : super(key: key);

  @override
  State<LoginPageDriver> createState() => _LoginPageDriverState();
}

class _LoginPageDriverState extends State<LoginPageDriver> {
  bool checkBoxVal=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('SaathChalo          ')),

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0, right: 130),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,)),
                    Text(" as Driver", style: TextStyle(fontSize: 28)),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 138),
                child: Text("Please login to continue", style: TextStyle(fontSize: 17)),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 32,right: 32,left: 32),
                child: Column(
                  children:  [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Color(0xffDCDEDF))
                        ),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Color(0xffDCDEDF))
                        ),
                        labelText: 'E-mail',
                        hintText: 'e.g. john@gmail.com',
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xffDCDEDF))
                          ),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xffDCDEDF))
                          ),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only( right: 20, left: 20),
                child: Row(
                children: [
                  Checkbox(value: checkBoxVal,
                      side: const BorderSide(color: Color(0xffDCDEDF)),
                      checkColor: Colors.white,
                      activeColor: const Color(0xffF65E5D),
                      onChanged:(value){
                          setState(() {
                            checkBoxVal=value as bool;
                          });
                       }
                      ),
                  const Text("Remember Me", style: TextStyle(fontSize: 13, color: Color(0xffF65E5D))),
                  const SizedBox(width: 100),
                  GestureDetector(
                    onTap: (){

                    },
                      child: const Text("Forgot Password?",
                          style: TextStyle(fontSize: 13, color: Color(0xff0000EE))
                      )
                  ),
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {

                  },
                      child: const Text("Login", style: TextStyle(fontSize: 18))
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25,right: 25, left: 25),
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
                      onPressed: () {

                      },
                    ),
                    SignInButton.mini(
                      buttonType: ButtonType.google,
                      onPressed: () {

                      },
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Do not have an account?"),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Text("Sign Up",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xffF65E5D),
                              fontWeight: FontWeight.w900
                          )
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
