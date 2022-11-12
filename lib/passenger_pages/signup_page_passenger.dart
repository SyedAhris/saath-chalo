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
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, right: 86, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Sign up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,)),
                        Text(" as Passenger", style: TextStyle(fontSize: 28)),
                      ],
                    ),
                  ),

                   Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: const [
                        Text("Create an account to get all the features", style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 32,right: 40,left: 20),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: Color(0xffDCDEDF))
                            ),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: Color(0xffDCDEDF))
                            ),
                            labelText: 'First Name',
                            hintText: 'e.g. Mohammad',
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
                              labelText: 'Last Name',
                              hintText: 'e.g. Irtiza',
                            ),
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
                              labelText: 'Phone Number',
                              hintText: 'e.g. 090078601',
                            ),
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
                              labelText: 'Email',
                              hintText: 'e.g. irtiza@gmail.com',
                            ),
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
                              hintText: 'e.g. **********',
                            ),
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
                              labelText: 'Confirm Password',
                              hintText: 'e.g. **********',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        )
    );
  }
}
