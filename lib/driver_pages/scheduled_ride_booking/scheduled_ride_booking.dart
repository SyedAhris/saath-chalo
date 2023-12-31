import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/scheduled_ride_live_booking/scheduled_ride_live_booking.dart';
import 'package:flutterdemo/global_components/main_button.dart';
import 'package:flutterdemo/global_components/map_wrapper.dart';
import 'package:flutterdemo/providers_repositories/driver/scheduled_rides_detailed/driver_scheduled_rides_detailed_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/convert_time.dart';
import '../../global_components/driver_booked_ride_card.dart';
import '../../global_components/driver_side_bar.dart';
import '../../global_components/main_app_bar.dart';

class ScheduledRideBooking extends StatefulWidget {
  const ScheduledRideBooking({Key? key, required this.rideId})
      : super(key: key);

  final String rideId;

  @override
  State<ScheduledRideBooking> createState() => _ScheduledRideBookingState();
}

class _ScheduledRideBookingState extends State<ScheduledRideBooking> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<DriverScheduledRidesDetailedProvider>()
          .fetchRide(widget.rideId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ride = context.watch<DriverScheduledRidesDetailedProvider>().ride;
    final vehicle =
        context.watch<DriverScheduledRidesDetailedProvider>().vehicle;
    final passengers =
        context.watch<DriverScheduledRidesDetailedProvider>().passengers;
    final isFetching =
        context.watch<DriverScheduledRidesDetailedProvider>().isFetching;
    return Scaffold(
      drawer: const DriverSideBar(),
      appBar: const MainAppBar(title: "Scheduled Rides"),
      body: (isFetching)
          ? const Padding(
              padding: EdgeInsets.only(top: 80.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : MapWrapper(
              waypoints: ride.waypoints,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DriverBookedRideCard(
                            car:
                                "${vehicle.color} ${vehicle.make} ${vehicle.model}",
                            numberPlate: vehicle.plateNumber,
                            journeyStart: ride.startingDestination,
                            journeyEnd: ride.endingDestination,
                            acStatus: vehicle.ac,
                            journeyDate:
                                ConvertTime.millisecondsToDate(ride.date),
                            journeyTime:
                                ConvertTime.millisecondsToTime(ride.time),
                            estCost: ride.totalFare,
                            passengers: passengers
                                .map((e) => "${e.firstName} ${e.lastName}")
                                .toList(), seats: '${ride.availableSeats}/${vehicle.seatingCapacity}',
                          ),
                          MainButton(
                              width: 250,
                              text: "Start Ride",
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
//                                const LoginPagePassenger()));
                                        const ScheduledRideLiveBooking()));
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
