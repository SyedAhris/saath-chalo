import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/passenger_side_bar.dart';
import 'package:flutterdemo/global_components/ride_card.dart';
import 'package:flutterdemo/passenger_pages/booked_ride_details/passenger_booked_rides_accepted.dart';
import 'package:flutterdemo/passenger_pages/booked_ride_details/passenger_booked_rides_declined.dart';
import 'package:flutterdemo/passenger_pages/booked_ride_details/passenger_booked_rides_pending.dart';
import 'package:flutterdemo/passenger_pages/passenger_booked_rides/booked_rides_demo.dart';
import '../../global_components/main_app_bar.dart';

class PassengerBookedRides extends StatefulWidget {
  const PassengerBookedRides({Key? key}) : super(key: key);

  @override
  State<PassengerBookedRides> createState() => _PassengerBookedRidesState();
}

class _PassengerBookedRidesState extends State<PassengerBookedRides> {
  @override
  Widget build(BuildContext context) {
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
                  Icon(
                    Icons.check_circle_outline_outlined,
                    color: Colors.green)
                ],
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: accepted.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const PassengerBookedRidesAccepted()
                                )
                            );
                          },
                          child: RideCard(
                            journeyStart: accepted[index].journeyStart,
                            journeyEnd: accepted[index].journeyEnd,
                            journeyDate: accepted[index].journeyDate,
                            journeyTime: accepted[index].journeyTime,
                            estCost: accepted[index].estCost,
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
                  Icon(
                      Icons.access_time,
                      color: Colors.black)
                ],
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: pending.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const PassengerBookedRidesPending()
                                )
                            );
                          },
                          child: RideCard(
                            journeyStart: pending[index].journeyStart,
                            journeyEnd: pending[index].journeyEnd,
                            journeyDate: pending[index].journeyDate,
                            journeyTime: pending[index].journeyTime,
                            estCost: pending[index].estCost,
                          ),
                        ),
                      ],
                    );
                  }),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    child: Text(
                      "Rejected",
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
                  Icon(
                      Icons.cancel_outlined,
                      color: Colors.red)
                ],
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: rejected.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const PassengerBookedRidesDeclined()
                                )
                            );
                          },
                          child: RideCard(
                            journeyStart: rejected[index].journeyStart,
                            journeyEnd: rejected[index].journeyEnd,
                            journeyDate: rejected[index].journeyDate,
                            journeyTime: rejected[index].journeyTime,
                            estCost: rejected[index].estCost,
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
List<BookedRidesDemo> pending = [
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
List<BookedRidesDemo> rejected = [
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