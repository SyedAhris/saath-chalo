import 'package:flutter/material.dart';

class RecurringRideWidget extends StatelessWidget {
  const RecurringRideWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      child: ListTile(
        leading: Text('Recurring Ride'),
        trailing: Switch(
          onChanged: (bool) => {},
          value: true,
        ),
      ),
    );
  }
}
