import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/driver_ride_history_details/driver_ride_history_details.dart';
import 'package:flutterdemo/global_components/driver_side_bar.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/global_components/ride_card.dart';

import '../../passenger_pages/passenger_ride_history/passenger_ride_demo.dart';

class DriverRideHistory extends StatefulWidget {
  const DriverRideHistory({Key? key}) : super(key: key);

  @override
  State<DriverRideHistory> createState() => _DriverRideHistoryState();
}

class _DriverRideHistoryState extends State<DriverRideHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DriverSideBar(),
      appBar: const MainAppBar(
        title: "Ride History",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
          child: Column(
            children: [
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: ridehistory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const DriverRideHistoryDetails()
                                )
                            );
                          },
                          child: RideCard(
                            journeyStart: ridehistory[index].journeyStart,
                            journeyEnd: ridehistory[index].journeyEnd,
                            journeyDate: ridehistory[index].journeyDate,
                            journeyTime: ridehistory[index].journeyTime,
                            estCost: ridehistory[index].estCost,
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

List<PassengerRideDemo> ridehistory = [
  PassengerRideDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600
  ),
  PassengerRideDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600
  ),
  PassengerRideDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600
  ),
  PassengerRideDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600
  ),
  PassengerRideDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600
  ),
  PassengerRideDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600
  ),
  PassengerRideDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600
  ),
  PassengerRideDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600
  ),
];