import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/constants.dart';

class LocationTextField extends StatelessWidget {
  const LocationTextField(
      {Key? key, required this.labelText, required this.hintText})
      : super(key: key);
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.always,
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
