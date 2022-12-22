import 'package:flutter/material.dart';

import '../../../models/rides_json.dart';
import 'driver_ride_history_repository.dart';

class DriverRideHistoryProvider with ChangeNotifier {
  List<Ride> rides = [];

  bool isFetching = false;

  final DriverRideHistoryRepository _driverRideHistoryRepository =
      DriverMockRideHistoryRepository();
  //would be called in initState of rideHistory Screen
  fetchRide(String driverId) async {
    isFetching = true;
    notifyListeners();
    rides = await _driverRideHistoryRepository.fetchRides(driverId);
    isFetching = false;
    notifyListeners();
  }
}
