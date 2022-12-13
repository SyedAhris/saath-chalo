import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/global_components/passenger_side_bar.dart';
import 'package:flutterdemo/global_components/ride_card.dart';
import 'package:flutterdemo/passenger_pages/passenger_ride_history/passenger_ride_demo.dart';
import 'package:flutterdemo/passenger_pages/passenger_ride_history_details/passenger_ride_history_details.dart';

class PassengerRideHistory extends StatefulWidget {
  const PassengerRideHistory({Key? key}) : super(key: key);

  @override
  State<PassengerRideHistory> createState() => _PassengerRideHistoryState();
}

class _PassengerRideHistoryState extends State<PassengerRideHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PassengerSideBar(),
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
                                    builder: (context) => const PassengerRideHistoryDetails()
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