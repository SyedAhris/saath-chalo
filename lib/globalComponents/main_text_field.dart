import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/constants.dart';

class MainTextField extends StatelessWidget {
  const MainTextField(
      {Key? key, required this.labelText, required this.hintText})
      : super(key: key);

  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: MainColors.primary)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: MainColors.primary)),
          labelText: labelText,
          hintText: hintText),
    );
  }
}
