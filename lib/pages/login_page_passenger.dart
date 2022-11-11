import 'package:flutter/material.dart';

class LoginPagePassenger extends StatefulWidget {
  const LoginPagePassenger({Key? key}) : super(key: key);

  @override
  State<LoginPagePassenger> createState() => _LoginPagePassengerState();
}

class _LoginPagePassengerState extends State<LoginPagePassenger> {
  bool checkBoxVal=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('SaathChalo          ')),

      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 75, right: 90, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,)),
                  Text(" as Passenger", style: TextStyle(fontSize: 28)),
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
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      labelText: 'E-mail',
                      hintText: 'e.g. john@gmail.com',
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
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
                const Text("Forgot Password?", style: TextStyle(fontSize: 13, color: Color(0xff0000EE))),
              ],
              ),
            ),



          ],

        ),
      ),
    );
  }
}
