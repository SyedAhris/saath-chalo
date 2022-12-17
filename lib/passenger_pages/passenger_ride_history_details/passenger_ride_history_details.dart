import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/global_components/passenger_ride_history_details_card.dart';
import 'package:flutterdemo/global_components/passenger_side_bar.dart';
import 'package:flutterdemo/providers_repositories/passenger/ride_history_details/ride_history_details_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/convert_time.dart';
import '../../providers_repositories/current_user/current_user_provider.dart';

class PassengerRideHistoryDetails extends StatefulWidget {
  const PassengerRideHistoryDetails({
    Key? key,
    required this.rideId,
  }) : super(key: key);

  final String rideId;

  @override
  State<PassengerRideHistoryDetails> createState() =>
      _PassengerRideHistoryDetailsState();
}

class _PassengerRideHistoryDetailsState
    extends State<PassengerRideHistoryDetails> {
  @override
  void initState() {
    super.initState();
    context.read<RideHistoryDetailsProvider>().fetchRide(widget.rideId);
  }

  @override
  Widget build(BuildContext context) {
    final ride = context.watch<RideHistoryDetailsProvider>().ride;
    final driver = context.watch<RideHistoryDetailsProvider>().driver;
    final vehicle = context.watch<RideHistoryDetailsProvider>().vehicle;
    final passengers = context.watch<RideHistoryDetailsProvider>().passengers;
    return Scaffold(
        drawer: const PassengerSideBar(),
        appBar: const MainAppBar(title: "Booked Rides"),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/backimg.png'))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
                child: PassengerRideHistoryDetailsCard(
                  name: "${driver.firstName} ${driver.lastName}",
                  rating: driver.rating,
                  car: "${vehicle.color} ${vehicle.make} ${vehicle.model}",
                  numberPlate: vehicle.plateNumber,
                  journeyStart: ride.startingDestination,
                  journeyEnd: ride.endingDestination,
                  acStatus: vehicle.ac,
                  journeyDate: ConvertTime.millisecondsToDate(ride.date),
                  journeyTime: ConvertTime.millisecondsToTime(ride.time),
                  estCost: ride.totalFare,
                  passengers: passengers,
                ),
              ),
            ],
          ),
        ));
  }
}
