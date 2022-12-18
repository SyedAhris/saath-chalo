import 'package:flutter/material.dart';
import 'package:flutterdemo/providers_repositories/driver/scheduled_rides/driver_scheduled_rides_repository.dart';
import 'package:flutterdemo/providers_repositories/passenger/booked_rides/booked_rides_repository.dart';

import '../../../models/rides_json.dart';

class DriverScheduledRidesProvider with ChangeNotifier {
  List<Ride> rideNow = [];
  List<Ride> upcomingRide = [];

  bool isFetching = false;

  final DriverScheduledRideRepository _driverScheduledRideRepository = DriverFirebaseScheduledRideRepository();

  //this function will be called in the initState of the screen then all the functions will be accessible through the created variables.
  fetchRides (String driverId) async {
    isFetching = true;
    notifyListeners();
    rideNow = await _driverScheduledRideRepository.getRideNow(driverId);
    upcomingRide = await _driverScheduledRideRepository.getUpcomingRide(driverId);
    isFetching = false;
    notifyListeners();
  }
}