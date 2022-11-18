import 'package:flutter/material.dart';

class ChooseDateButton extends StatelessWidget {
  const ChooseDateButton({
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
              Icons.calendar_today_outlined,
              size: 20,
            ),
            Text("Choose Date"),
          ],
        ));
  }
}
