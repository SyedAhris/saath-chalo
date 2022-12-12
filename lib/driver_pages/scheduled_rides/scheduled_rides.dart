import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/globalComponents/ride_history_card.dart';

class ScheduledRides extends StatelessWidget {
  const ScheduledRides({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: <Widget>[
                    Text(
                      "Ride Now",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito'),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        indent: 5,
                        endIndent: 50,
                      ),
                    ),
                  ],
                ),
                RideHistoryCard(),
                Row(
                  children: <Widget>[
                    Text(
                      "Upcoming Rides",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito'),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        indent: 5,
                        endIndent: 50,
                      ),
                    ),
                  ],
                ),
                RideHistoryCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
