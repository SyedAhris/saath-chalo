import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/constants.dart';

class MainLocationTextField extends StatelessWidget {
  const MainLocationTextField(
      {Key? key, required this.labelText, required this.hintText})
      : super(key: key);
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: MainColors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: MainColors.grey)),
          labelText: labelText,
          hintText: hintText),
    );
  }
}
