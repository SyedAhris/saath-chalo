import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class EnterResetCode extends StatefulWidget {
  const EnterResetCode({super.key});

  @override
  State<EnterResetCode> createState() => _EnterResetCodeState();
}

class _EnterResetCodeState extends State<EnterResetCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 80, 0, 20),
                child: Icon(
                  Icons.lock_person,
                  size: 100.0,
                  color: Color(0xffF65E5D),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Enter Reset Code',
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "We have sent you the password reset code to the email address.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: OtpTextField(
              numberOfFields: 5,
              borderColor: Color(0xffF65E5D),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Verification Code",
                        ),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: 355,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Proceed to Change Password",
                  style: TextStyle(fontSize: 18, fontFamily: 'Nunito'),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text(
                  'If you did not recieve a link?',
                  style: TextStyle(fontFamily: 'Nunito'),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text(
                  'Send Again',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Color(0xffF65E5D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
