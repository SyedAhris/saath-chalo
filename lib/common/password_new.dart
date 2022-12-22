import 'package:flutter/material.dart';
import 'package:flutterdemo/common/password_changed.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';

class PasswordNew extends StatefulWidget {
  const PasswordNew({super.key});

  @override
  State<PasswordNew> createState() => _PasswordNewState();
}

class _PasswordNewState extends State<PasswordNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: "SaathChalo"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
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
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xffDCDEDF),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xffDCDEDF),
                    ),
                  ),
                  labelText: 'New Password',
                  hintText: 'Atleast 6 characters long',
                  errorText: 'Password entered is too short',
                  errorMaxLines: 2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xffDCDEDF),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xffDCDEDF),
                    ),
                  ),
                  labelText: 'Confirm Password',
                  hintText: '*****',
                  errorText: 'Password entered does not match',
                  errorMaxLines: 2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: 355,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PasswordChanged()));
                  },
                  child: const Text(
                    "Change Password",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
