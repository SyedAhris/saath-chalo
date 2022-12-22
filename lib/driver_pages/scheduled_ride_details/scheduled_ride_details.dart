import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/convert_time.dart';
import 'package:flutterdemo/driver_pages/passenger_requests/passenger_requests.dart';
import 'package:flutterdemo/global_components/map_wrapper.dart';
import 'package:flutterdemo/providers_repositories/driver/scheduled_rides_detailed/driver_scheduled_rides_detailed_provider.dart';
import 'package:provider/provider.dart';

import '../../global_components/driver_booked_ride_card.dart';
import '../../global_components/driver_side_bar.dart';
import '../../global_components/main_app_bar.dart';
import '../../global_components/main_button.dart';

class ScheduledRideDetails extends StatefulWidget {
  const ScheduledRideDetails({Key? key, required this.rideId})
      : super(key: key);

  final String rideId;

  @override
  State<ScheduledRideDetails> createState() => _ScheduledRideDetailsState();
}

class _ScheduledRideDetailsState extends State<ScheduledRideDetails> {
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
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
                child: SafeArea(
                  child: Column(
                    children: [
                      DriverBookedRideCard(
                        car:
                            "${vehicle.color} ${vehicle.make} ${vehicle.model}",
                        numberPlate: vehicle.plateNumber,
                        journeyStart: ride.startingDestination,
                        journeyEnd: ride.endingDestination,
                        acStatus: vehicle.ac,
                        journeyDate: ConvertTime.millisecondsToDate(ride.date),
                        journeyTime: ConvertTime.millisecondsToTime(ride.time),
                        estCost: ride.totalFare,
                        passengers: passengers
                            .map((e) => "${e.firstName} ${e.lastName}")
                            .toList(), seats: '${ride.availableSeats}/${vehicle.seatingCapacity}',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: SizedBox(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PassengerRequests(
                                          passengerRequests:
                                              ride.passengerRequests, ride: ride,
                                        )));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Passenger Requests",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  )
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 310, bottom: 20),
                        child: MainButton(
                            width: 250, text: "Cancel Ride", onTap: () {}),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
