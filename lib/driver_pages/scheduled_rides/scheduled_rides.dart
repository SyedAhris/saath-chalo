import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/convert_time.dart';
import 'package:flutterdemo/driver_pages/scheduled_ride_booking/scheduled_ride_booking.dart';
import 'package:flutterdemo/driver_pages/scheduled_ride_details/scheduled_ride_details.dart';
import 'package:flutterdemo/global_components/driver_side_bar.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_provider.dart';
import 'package:flutterdemo/providers_repositories/driver/scheduled_rides/driver_scheduled_rides_provider.dart';
import 'package:provider/provider.dart';

import '../../global_components/ride_card.dart';

class ScheduledRides extends StatefulWidget {
  const ScheduledRides({Key? key}) : super(key: key);

  @override
  State<ScheduledRides> createState() => _ScheduledRidesState();
}

class _ScheduledRidesState extends State<ScheduledRides> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<DriverScheduledRidesProvider>()
          .fetchRides(context.read<CurrentUserProvider>().currentCustomer.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final rideNow = context.watch<DriverScheduledRidesProvider>().rideNow;
    final upcomingRides =
        context.watch<DriverScheduledRidesProvider>().upcomingRide;
    final isFetching = context.watch<DriverScheduledRidesProvider>().isFetching;
    return Scaffold(
      drawer: DriverSideBar(),
      appBar: const MainAppBar(title: "Scheduled Rides"),
      body: SingleChildScrollView(
        child: (isFetching)
            ? const Padding(
                padding: EdgeInsets.only(top: 80.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Padding(
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
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                    context.watch<DriverScheduledRidesProvider>().isFetching
                        ? const CircularProgressIndicator()
                        : ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: rideNow.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ScheduledRideBooking(
                                                    rideId: rideNow[index].id,
                                                  )));
                                    },
                                    child: RideCard(
                                      journeyStart:
                                          rideNow[index].startingDestination,
                                      journeyEnd:
                                          rideNow[index].endingDestination,
                                      journeyDate:
                                          ConvertTime.millisecondsToDate(
                                              rideNow[index].date),
                                      journeyTime:
                                          ConvertTime.millisecondsToTime(
                                              rideNow[index].time),
                                      estCost:
                                          rideNow[index].totalFare.toDouble(),
                                    ),
                                  ),
                                ],
                              );
                            }),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            "Upcoming Rides",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          ScheduledRideDetails(
                                            rideId: upcomingRides[index].id,
                                          )));
                                },
                                child: RideCard(
                                  journeyStart:
                                      upcomingRides[index].startingDestination,
                                  journeyEnd:
                                      upcomingRides[index].endingDestination,
                                  journeyDate: ConvertTime.millisecondsToDate(
                                      upcomingRides[index].date),
                                  journeyTime: ConvertTime.millisecondsToTime(
                                      upcomingRides[index].time),
                                  estCost:
                                      upcomingRides[index].totalFare.toDouble(),
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

// List<BookedRidesDemo> rideNow = [
//   BookedRidesDemo(
//       journeyStart: "Institute of Business Administration",
//       journeyEnd: "Askari 4",
//       journeyDate: "26/11/2022",
//       journeyTime: "09:15",
//       estCost: 600),
//   BookedRidesDemo(
//       journeyStart: "Institute of Business Administration",
//       journeyEnd: "Askari 4",
//       journeyDate: "26/11/2022",
//       journeyTime: "09:15",
//       estCost: 600),
// ];
// List<BookedRidesDemo> upcomingRides = [
//   BookedRidesDemo(
//       journeyStart: "Institute of Business Administration",
//       journeyEnd: "Askari 4",
//       journeyDate: "26/11/2022",
//       journeyTime: "09:15",
//       estCost: 600),
//   BookedRidesDemo(
//       journeyStart: "Institute of Business Administration",
//       journeyEnd: "Askari 4",
//       journeyDate: "26/11/2022",
//       journeyTime: "09:15",
//       estCost: 600),
// ];
