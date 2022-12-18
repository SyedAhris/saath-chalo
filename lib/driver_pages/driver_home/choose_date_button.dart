import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutterdemo/constants/constants.dart';

class ChooseDateButton extends StatefulWidget {
  const ChooseDateButton({
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseDateButton> createState() => _ChooseDateButtonState();
}

class _ChooseDateButtonState extends State<ChooseDateButton> {
  late int dateDay;
  late int dateMonth;
  late int dateYear;
  late DateTime dateChosen;
  bool dateSelected = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: dateSelected == false
          ? TextButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: Colors.white)
          : TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: MainColors.primary),
      onPressed: () {
        DatePicker.showDatePicker(context,
            showTitleActions: true,
            minTime: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day),
            maxTime: DateTime(DateTime.now().year + 5, 12, 31),
            onChanged: (date) {}, onConfirm: (date) {
          dateDay = date.day;
          dateMonth = date.month;
          dateYear = date.year;
          dateSelected = true;
          dateChosen = date;
          setState(() {});
        }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
      child: Row(
        children: [
          const Icon(
            Icons.calendar_today_outlined,
            size: 20,
          ),
          Container(
            child: dateSelected == false
                ? const Text("Choose Date")
                : Text(" $dateDay/$dateMonth/$dateYear"),
          )
        ],
      ),
    );
  }
}
