import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/globalComponents/ride_history_card.dart';

class PassengerRideHistory extends StatefulWidget {
  const PassengerRideHistory({super.key});

  @override
  State<PassengerRideHistory> createState() => _PassengerRideHistoryState();
}

class _PassengerRideHistoryState extends State<PassengerRideHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [RideHistoryCard(), RideHistoryCard()],
      ),
    );
  }
}
