import 'package:flutter/material.dart';

class SignupPassenger extends StatefulWidget {
  const SignupPassenger({Key? key}) : super(key: key);

  @override
  State<SignupPassenger> createState() => _SignupPassengerState();
}

class _SignupPassengerState extends State<SignupPassenger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('SaathChalo          ')),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 75),
            child: Center(
              child: Column(
                children: [

                ],
              ),
            ),
          ),
        )
    );
  }
}
