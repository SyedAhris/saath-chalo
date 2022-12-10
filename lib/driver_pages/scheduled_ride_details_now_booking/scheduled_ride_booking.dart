import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/scheduled_ride_live_booking/scheduled_ride_live_booking.dart';
import 'package:flutterdemo/globalComponents/driver_booked_ride_card.dart';
import 'package:flutterdemo/globalComponents/main_app_bar.dart';
import 'package:flutterdemo/globalComponents/main_button.dart';
import 'package:flutterdemo/globalComponents/side_bar.dart';
import 'package:flutterdemo/passenger_pages/passenger_home/passenger_home.dart';

class ScheduledRideBooking extends StatefulWidget {
  const ScheduledRideBooking({Key? key}) : super(key: key);

  @override
  State<ScheduledRideBooking> createState() => _ScheduledRideBookingState();
}

class _ScheduledRideBookingState extends State<ScheduledRideBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(
        tapHome: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const PassengerHome())),
      ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 390, bottom: 20),
                  child: MainButton(
                    width: 250,
                      text: "Start Ride",
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
//                                const LoginPagePassenger()));
                            const ScheduledRideLiveBooking()
                        )
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
