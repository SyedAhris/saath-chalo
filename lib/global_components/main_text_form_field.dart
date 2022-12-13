import 'package:flutter/material.dart';

import '../constants/constants.dart';

class MainTextFormField extends StatelessWidget {
  const MainTextFormField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.controller,
      required this.validator,
      required this.obscureText,
      required this.enableSuggestions})
      : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final bool enableSuggestions;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: MainColors.grey)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: MainColors.grey)),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
