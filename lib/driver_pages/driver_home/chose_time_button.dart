import 'package:flutter/material.dart';

class ChoseTimeButton extends StatelessWidget {
  const ChoseTimeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            primary: Colors.black, backgroundColor: Colors.white),
        onPressed: () => {},
        child: Row(
          children: [
            Icon(
              Icons.access_time_outlined,
              size: 20,
            ),
            Text("Choose Time"),
          ],
        ));
  }
}
