import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/convert_time.dart';
import 'package:flutterdemo/global_components/passenger_side_bar.dart';
import 'package:flutterdemo/global_components/ride_card.dart';
import 'package:flutterdemo/passenger_pages/booked_ride_details/passenger_booked_rides_accepted.dart';
import 'package:flutterdemo/passenger_pages/passenger_booked_rides/booked_rides_demo.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_provider.dart';
import 'package:flutterdemo/providers_repositories/passenger/booked_rides/booked_rides_provider.dart';
import 'package:provider/provider.dart';

import '../../global_components/main_app_bar.dart';

class PassengerBookedRides extends StatefulWidget {
  const PassengerBookedRides({Key? key}) : super(key: key);

  @override
  State<PassengerBookedRides> createState() => _PassengerBookedRidesState();
}

class _PassengerBookedRidesState extends State<PassengerBookedRides> {
  @override
  void initState() {
    super.initState();
    context
        .read<BookedRidesProvider>()
        .fetchRides(context.read<CurrentUserProvider>().currentCustomer.id);
  }

  @override
  Widget build(BuildContext context) {
    final approvedRides = context.watch<BookedRidesProvider>().approvedRides;
    final pendingRides = context.watch<BookedRidesProvider>().pendingRides;
    final rejectedRides = context.watch<BookedRidesProvider>().rejectedRides;

    return Scaffold(
      drawer: PassengerSideBar(),
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
                      "Approved",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  Icon(Icons.check_circle_outline_outlined, color: Colors.green)
                ],
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: approvedRides.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    PassengerBookedRidesAccepted(
                                      rideId: approvedRides[index].id,
                                      status: 'Accepted',
                                    )));
                          },
                          child: RideCard(
                            journeyStart:
                                approvedRides[index].startingDestination,
                            journeyEnd: approvedRides[index].endingDestination,
                            journeyDate: ConvertTime.millisecondsToDate(
                                approvedRides[index].date),
                            journeyTime: ConvertTime.millisecondsToTime(
                                approvedRides[index].time),
                            estCost: approvedRides[index].totalFare.toDouble(),
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
                      "Pending",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  Icon(Icons.access_time, color: Colors.black)
                ],
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: pendingRides.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PassengerBookedRidesAccepted(
                                  rideId: pendingRides[index].id,
                                  status: 'None',
                                ),
                              ),
                            );
                          },
                          child: RideCard(
                            journeyStart:
                                pendingRides[index].startingDestination,
                            journeyEnd: pendingRides[index].endingDestination,
                            journeyDate: ConvertTime.millisecondsToDate(
                                pendingRides[index].date),
                            journeyTime: ConvertTime.millisecondsToTime(
                                pendingRides[index].time),
                            estCost: pendingRides[index].totalFare.toDouble(),
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
                      "Rejected",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  Icon(Icons.cancel_outlined, color: Colors.red)
                ],
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: rejectedRides.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PassengerBookedRidesAccepted(
                                  rideId: rejectedRides[index].id,
                                  status: 'Rejected',
                                ),
                              ),
                            );
                          },
                          child: RideCard(
                            journeyStart:
                                rejectedRides[index].startingDestination,
                            journeyEnd: rejectedRides[index].endingDestination,
                            journeyDate: ConvertTime.millisecondsToDate(
                                rejectedRides[index].date),
                            journeyTime: ConvertTime.millisecondsToTime(
                                rejectedRides[index].time),
                            estCost: rejectedRides[index].totalFare.toDouble(),
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

List<BookedRidesDemo> accepted = [
  BookedRidesDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600),
  BookedRidesDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600),
];
List<BookedRidesDemo> pending = [
  BookedRidesDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600),
  BookedRidesDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600),
];
List<BookedRidesDemo> rejected = [
  BookedRidesDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600),
  BookedRidesDemo(
      journeyStart: "Institute of Business Administration",
      journeyEnd: "Askari 4",
      journeyDate: "26/11/2022",
      journeyTime: "09:15",
      estCost: 600),
];
