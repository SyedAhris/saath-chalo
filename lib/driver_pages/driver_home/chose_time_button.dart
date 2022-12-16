import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutterdemo/constants/constants.dart';

class ChoseTimeButton extends StatefulWidget {
  const ChoseTimeButton({
    Key? key,
  }) : super(key: key);

  @override
  State<ChoseTimeButton> createState() => _ChoseTimeButtonState();
}

class _ChoseTimeButtonState extends State<ChoseTimeButton> {
  late int timeHour;
  late int timeMinute;
  late DateTime timeChosen;
  bool timeSelected=false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: timeSelected==false?
        TextButton.styleFrom(
            foregroundColor: Colors.black, backgroundColor: Colors.white)
            :
        TextButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: MainColors.primary)
        ,
        onPressed: () {
          DatePicker.showTime12hPicker(context, showTitleActions: true,
              onChanged: (date) {
              },
              onConfirm: (date) {
                timeHour=date.hour;
                timeMinute=date.minute;
                timeSelected=true;
                timeChosen=date;
                setState(() {
                });
              },
              currentTime: DateTime.now());
        },
        child: Row(
          children:  [
            const Icon(
              Icons.access_time_outlined,
              size: 20,
            ),
            Container(
              child: timeSelected==false?
              const Text("Choose Date")
                  :
              Text(" $timeHour:$timeMinute"),
            )
          ],
        ));
  }
}
