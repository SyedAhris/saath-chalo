import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/scheduled_ride_booking/scheduled_ride_booking.dart';
import 'package:flutterdemo/driver_pages/scheduled_ride_details/scheduled_ride_details.dart';
import 'package:flutterdemo/global_components/driver_side_bar.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/passenger_pages/passenger_booked_rides/booked_rides_demo.dart';

import '../../global_components/ride_card.dart';

class ScheduledRides extends StatefulWidget {
  const ScheduledRides({Key? key}) : super(key: key);

  @override
  State<ScheduledRides> createState() => _ScheduledRidesState();
}

class _ScheduledRidesState extends State<ScheduledRides> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DriverSideBar(),
      appBar: const MainAppBar(title: "Booked Rides"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Ride Now",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: rideNow.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const ScheduledRideBooking()
                                )
                            );
                          },
                          child: RideCard(
                            journeyStart: rideNow[index].journeyStart,
                            journeyEnd: rideNow[index].journeyEnd,
                            journeyDate: rideNow[index].journeyDate,
                            journeyTime: rideNow[index].journeyTime,
                            estCost: rideNow[index].estCost,
                          ),
                        ),
                      ],
                    );
                  }),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top:10,bottom: 10),
                    child: Text(
                      "Pending",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: upcomingRides.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const ScheduledRideDetails()
                                )
                            );
                          },
                          child: RideCard(
                            journeyStart: upcomingRides[index].journeyStart,
                            journeyEnd: upcomingRides[index].journeyEnd,
                            journeyDate: upcomingRides[index].journeyDate,
                            journeyTime: upcomingRides[index].journeyTime,
                            estCost: upcomingRides[index].estCost,
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

List<BookedRidesDemo> rideNow = [
  BookedRidesDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600
  ),
  BookedRidesDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600
  ),
];
List<BookedRidesDemo> upcomingRides = [
  BookedRidesDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600
  ),
  BookedRidesDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600
  ),
];