import 'package:flutter/material.dart';
import 'package:flutterdemo/globalComponents/driver_booked_ride_card.dart';
import 'package:flutterdemo/globalComponents/main_app_bar.dart';

class ScheduledRideBooking extends StatefulWidget {
  const ScheduledRideBooking({Key? key}) : super(key: key);

  @override
  State<ScheduledRideBooking> createState() => _ScheduledRideBookingState();
}

class _ScheduledRideBookingState extends State<ScheduledRideBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: "Scheduled Rides"),
      body: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
          child: Column(
            children: [
              DriverBookedRideCard(
                  car: "Black Suzuki WagonR",
                  numberPlate: "ABC-123",
                  journeyStart: "Institute of Business Administration",
                  journeyEnd: "Askari 4",
                  acStatus: true,
                  journeyDate: "26/11/2022",
                  journeyTime: "09:15",
                  estCost: 600,
                passengers: [
                  "Mohammad Irtiza",
                  "Ahris"
                ],

              ),
            ],
          ),
        )
      ),
    );
  }
}
