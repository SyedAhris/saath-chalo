// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/common/enter_reset_code/enter_reset_code.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:provider/provider.dart';

import '../../global_components/main_text_form_field.dart';
import '../../providers_repositories/current_user/current_user_provider.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final _formKey = GlobalKey<FormState>();
  bool isEmpty=false;
  TextEditingController emailController= TextEditingController();
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
                    'Reset Password',
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
              children: const [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Please provide with your account email address that you previously used to login with.",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "A code will be sent to this email.",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: MainTextFormField(
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String email=emailController.text;
                      email=email.replaceAll(' ', '');
                      String error = await context
                          .read<CurrentUserProvider>()
                          .changePassword(email);
                      if (error != "") {
                        final snackBar = SnackBar(
                          content: Text(error),
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar);
                      } else {
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: const Text(
                    "Send Reset Code to Email",
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
