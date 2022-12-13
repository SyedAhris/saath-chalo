import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/constants.dart';

class MainTextField extends StatelessWidget {
  const MainTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.controller})
      : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: MainColors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: MainColors.grey)),
          labelText: labelText,
          hintText: hintText),
    );
  }
}
