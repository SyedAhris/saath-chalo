import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/convert_time.dart';
import 'package:flutterdemo/global_components/map_wrapper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../global_components/driver_booked_ride_card.dart';
import '../../global_components/driver_side_bar.dart';
import '../../global_components/main_app_bar.dart';
import '../../providers_repositories/driver/scheduled_rides_detailed/driver_scheduled_rides_detailed_provider.dart';

class ScheduledRideLiveBooking extends StatefulWidget {
  const ScheduledRideLiveBooking({Key? key}) : super(key: key);

  @override
  State<ScheduledRideLiveBooking> createState() =>
      _ScheduledRideLiveBookingState();
}

class _ScheduledRideLiveBookingState extends State<ScheduledRideLiveBooking> {
  @override
  Widget build(BuildContext context) {
    final ride = context.watch<DriverScheduledRidesDetailedProvider>().ride;
    final vehicle =
        context.watch<DriverScheduledRidesDetailedProvider>().vehicle;
    final passengers =
        context.watch<DriverScheduledRidesDetailedProvider>().passengers;
    return Scaffold(
      drawer: const DriverSideBar(),
      appBar: const MainAppBar(title: "Scheduled Rides"),
      body: MapWrapper(
        waypoints: ride.waypoints,
        markers: {
          Marker(
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            markerId: MarkerId('starting marker'),
            position: ride.waypoints[0].toLatLng(),
          ),
          Marker(
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            markerId: MarkerId('ending marker'),
            position: ride.waypoints[ride.waypoints.length - 1].toLatLng(),
          )
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
          child: SafeArea(
            child: Column(
              children: [
                DriverBookedRideCard(
                  car: "${vehicle.color} ${vehicle.make} ${vehicle.model}",
                  numberPlate: vehicle.plateNumber,
                  journeyStart: ride.startingDestination,
                  journeyEnd: ride.endingDestination,
                  acStatus: vehicle.ac,
                  journeyDate: ConvertTime.millisecondsToDate(ride.date),
                  journeyTime: ConvertTime.millisecondsToTime(ride.time),
                  estCost: ride.totalFare,
                  passengers: passengers
                      .map((e) => "${e.firstName} ${e.lastName}")
                      .toList(), seats: "${ride.availableSeats}/${vehicle.seatingCapacity}",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
