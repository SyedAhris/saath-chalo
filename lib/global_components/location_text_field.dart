import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/constants.dart';

class LocationTextField extends StatefulWidget {
  const LocationTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      this.controller,
      this.onSubmitted})
      : super(key: key);
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final void Function(String)? onSubmitted;

  @override
  State<LocationTextField> createState() => _LocationTextFieldState();
}

class _LocationTextFieldState extends State<LocationTextField> {
  // late TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: widget.onSubmitted,
      controller: widget.controller,
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
          labelText: widget.labelText,
          hintText: widget.hintText),
    );
  }
}
