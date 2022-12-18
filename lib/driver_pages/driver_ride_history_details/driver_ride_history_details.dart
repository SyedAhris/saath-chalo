import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/driver_side_bar.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/global_components/map_wrapper.dart';

import '../../global_components/driver_booked_ride_card.dart';

class DriverRideHistoryDetails extends StatefulWidget {
  const DriverRideHistoryDetails({Key? key}) : super(key: key);

  @override
  State<DriverRideHistoryDetails> createState() =>
      _DriverRideHistoryDetailsState();
}

class _DriverRideHistoryDetailsState extends State<DriverRideHistoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DriverSideBar(),
        appBar: const MainAppBar(title: "Ride History"),
        body: MapWrapper(
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
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
                )
              ],
            ),
          ),
        ));
  }
}
