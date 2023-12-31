import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {Key? key, required this.text, this.width = 360, this.height = 50, required this.onTap})
      : super(key: key);
  final String text;
  final double width;
  final double height;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: onTap,
          child: Text(text, style: const TextStyle(fontSize: 18))),
    );
  }
}
