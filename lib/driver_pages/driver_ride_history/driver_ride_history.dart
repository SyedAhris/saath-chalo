import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/convert_time.dart';
import 'package:flutterdemo/driver_pages/driver_ride_history_details/driver_ride_history_details.dart';
import 'package:flutterdemo/global_components/driver_side_bar.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/global_components/ride_card.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_provider.dart';
import 'package:flutterdemo/providers_repositories/driver/ride_history/driver_ride_history_provider.dart';
import 'package:provider/provider.dart';

import '../../passenger_pages/passenger_ride_history/passenger_ride_demo.dart';

class DriverRideHistory extends StatefulWidget {
  const DriverRideHistory({Key? key}) : super(key: key);

  @override
  State<DriverRideHistory> createState() => _DriverRideHistoryState();
}

class _DriverRideHistoryState extends State<DriverRideHistory> {

  @override
  void initState() {
    super.initState();
    context.read<DriverRideHistoryProvider>().fetchRide(context.read<CurrentUserProvider>().currentCustomer.id);
  }

  @override
  Widget build(BuildContext context) {
    final rides = context.watch<DriverRideHistoryProvider>().rides;
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
              context.watch<DriverRideHistoryProvider>().isFetching ?
                  const CircularProgressIndicator() :
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: rides.length,
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
                            journeyStart: rides[index].startingDestination,
                            journeyEnd: rides[index].endingDestination,
                            journeyDate: ConvertTime.millisecondsToDate(rides[index].date),
                            journeyTime: ConvertTime.millisecondsToTime(rides[index].time),
                            estCost: rides[index].totalFare.toDouble(),
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