import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/main_button.dart';
import 'package:flutterdemo/home_page/home_page.dart';
import 'package:flutterdemo/models/customer_json.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_provider.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../global_components/main_app_bar.dart';
import '../global_components/main_text_form_field.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController licenseNumberController = TextEditingController();
  String gender = "";
  bool isDriver = false;
  bool isPassenger = false;

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
                    padding: const EdgeInsets.only(top: 0, right: 0, left: 20),
                    child: Row(
                      children: const [
                        Text(
                          "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: const [
                        Text("Create an account to get all the features",
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 32, right: 40, left: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          MainTextFormField(
                            labelText: "First Name",
                            hintText: "Syed",
                            controller: firstNameController,
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
                              labelText: "Last Name",
                              hintText: "Ahris",
                              controller: lastNameController,
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
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: MainTextFormField(
                                labelText: "Phone Number",
                                hintText: "090078601",
                                controller: phoneNumberController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Required Field';
                                  }
                                  return null;
                                },
                                obscureText: false,
                                enableSuggestions: true,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: MainTextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Required Field";
                                } else if (value.length < 8) {
                                  return "Password must be at least 8 characters long";
                                }
                                return null;
                              },
                              controller: passwordController,
                              obscureText: true,
                              enableSuggestions: false,
                              labelText: 'Password',
                              hintText: '*****',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: MainTextFormField(
                                labelText: "Confirm Password",
                                hintText: "*****",
                                controller: confirmPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Required Field';
                                  } else if (value.length < 8) {
                                    return "Password must be at least 8 characters long";
                                  } else if (passwordController.text != value) {
                                    return "Password should be same as above";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                enableSuggestions: false),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: DropdownButtonFormField<String>(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required Field';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: MainColors.grey)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: MainColors.grey)),
                                labelText: "Gender",
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: "M",
                                  child: Text("Male"),
                                ),
                                DropdownMenuItem(
                                  value: "F",
                                  child: Text("Female"),
                                ),
                              ],
                              onChanged: (value) {
                                if (value != null) {
                                  gender = value;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: isDriver,
                                      side: const BorderSide(
                                          color: Color(0xffDCDEDF)),
                                      checkColor: Colors.white,
                                      activeColor: MainColors.primary,
                                      onChanged: (value) {
                                        setState(() {
                                          isDriver = value as bool;
                                        });
                                      },
                                    ),
                                    const Text(
                                      "Sign up as driver",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: MainColors.primary),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: isPassenger,
                                      side: const BorderSide(
                                          color: Color(0xffDCDEDF)),
                                      checkColor: Colors.white,
                                      activeColor: MainColors.primary,
                                      onChanged: (value) {
                                        setState(() {
                                          isPassenger = value as bool;
                                        });
                                      },
                                    ),
                                    const Text(
                                      "Sign up as passenger",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: MainColors.primary),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: isDriver,
                            child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: MainTextFormField(
                                    labelText: "License Number",
                                    hintText: "12039812312",
                                    controller: licenseNumberController,
                                    validator: (value) {
                                      if ((value == null || value.isEmpty) &&
                                          (isDriver)) {
                                        return 'Required Field';
                                      }
                                      return null;
                                    },
                                    obscureText: false,
                                    enableSuggestions: false)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, right: 15),
                    child: SizedBox(
                      width: 355,
                      height: 50,
                      child: MainButton(
                        text: 'Create User',
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            Customer customer = Customer(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              phone: phoneNumberController.text,
                              password: passwordController.text,
                              rating: 0,
                              profilePictureLink: "",
                              gender: gender,
                              isDriver: isDriver,
                              isPassenger: isPassenger,
                              licenseNumber: licenseNumberController.text,
                              isDelete: false,
                              id: '',
                            );
                            String error = await context
                                .read<CurrentUserProvider>()
                                .signup(customer);
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
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Login Here",
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
        ));
  }
}
