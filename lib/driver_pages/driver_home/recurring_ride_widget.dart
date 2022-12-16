import 'package:flutter/material.dart';

class RecurringRideWidget extends StatefulWidget {
   RecurringRideWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RecurringRideWidget> createState() => _RecurringRideWidgetState();
}

class _RecurringRideWidgetState extends State<RecurringRideWidget> {
   bool isSwitched=false;

   void toggleSwitch(bool value) {
     if(isSwitched == false)
     {
       setState(() {
         isSwitched = true;
       });
     }
     else
     {
       setState(() {
         isSwitched = false;
       });
     }
   }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      child: Column(
        children: [
          ListTile(
            leading: const Text('Recurring Ride'),
            trailing: Switch(
              onChanged: toggleSwitch,
              value: isSwitched,
            ),
          ),
          Container(
            child: isSwitched==true?
                Column(
                  children: [
                    Row(
                      children: [

                      ],
                    ),
                  ],
                )
                :
                null
          )
        ],
      ),
    );
  }
}
