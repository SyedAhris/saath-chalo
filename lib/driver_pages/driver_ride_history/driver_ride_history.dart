import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/globalComponents/ride_history_card.dart';

class DriverRideHistory extends StatelessWidget {
  const DriverRideHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: RideHistoryCard(),
          ),
        ],
      ),
    );
  }
}
