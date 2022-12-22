import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/global_components/passenger_side_bar.dart';
import 'package:flutterdemo/global_components/ride_card.dart';
import 'package:flutterdemo/passenger_pages/passenger_ride_history/passenger_ride_demo.dart';
import 'package:flutterdemo/passenger_pages/passenger_ride_history_details/passenger_ride_history_details.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_provider.dart';
import 'package:flutterdemo/providers_repositories/passenger/rides_history/ride_history_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/convert_time.dart';

class PassengerRideHistory extends StatefulWidget {
  const PassengerRideHistory({Key? key}) : super(key: key);

  @override
  State<PassengerRideHistory> createState() => _PassengerRideHistoryState();
}

class _PassengerRideHistoryState extends State<PassengerRideHistory> {
  @override
  void initState() {
    super.initState();
    context
        .read<RideHistoryProvider>()
        .fetchRide(context.read<CurrentUserProvider>().currentCustomer.id);
  }

  @override
  Widget build(BuildContext context) {
    final rides = context.watch<RideHistoryProvider>().rides;
    //final books = context.watch<BooksProvider>().books;
    //final rides = [];
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
              context.read<RideHistoryProvider>().isFetching
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: rides.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    PassengerRideHistoryDetails(
                                      rideId: rides[index].id,
                                    )));
                          },
                          child: RideCard(
                            journeyStart: rides[index].startingDestination,
                            journeyEnd: rides[index].endingDestination,
                            journeyDate: ConvertTime.millisecondsToDate(
                                rides[index].date),
                            journeyTime: ConvertTime.millisecondsToTime(
                                rides[index].time),
                            estCost: rides[index].totalFare.toDouble(),
                          ),
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
      estCost: 600),
  PassengerRideDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600),
  PassengerRideDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600),
  PassengerRideDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600),
  PassengerRideDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600),
  PassengerRideDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600),
  PassengerRideDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600),
  PassengerRideDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600),
];
