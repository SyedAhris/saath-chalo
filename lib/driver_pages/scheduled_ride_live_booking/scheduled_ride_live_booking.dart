import 'package:flutter/material.dart';
import 'package:flutterdemo/globalComponents/driver_booked_ride_card.dart';
import 'package:flutterdemo/globalComponents/driver_side_bar.dart';
import 'package:flutterdemo/globalComponents/main_app_bar.dart';

class ScheduledRideLiveBooking extends StatefulWidget {
  const ScheduledRideLiveBooking({Key? key}) : super(key: key);

  @override
  State<ScheduledRideLiveBooking> createState() =>
      _ScheduledRideLiveBookingState();
}

class _ScheduledRideLiveBookingState extends State<ScheduledRideLiveBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DriverSideBar(),
      appBar: const MainAppBar(title: "Scheduled Rides"),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/backimg.png'))),
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
          child: SafeArea(
            child: Column(
              children: const [
                DriverBookedRideCard(
                  car: "Black Suzuki WagonR",
                  numberPlate: "ABC-123",
                  journeyStart: "Institute of Business Administration",
                  journeyEnd: "Askari 4",
                  acStatus: true,
                  journeyDate: "26/11/2022",
                  journeyTime: "09:15",
                  estCost: 600,
                  passengers: ["Mohammad Irtiza", "Ahris"],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
