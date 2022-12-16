import 'package:flutter/material.dart';
import 'package:flutterdemo/models/vehicle_json.dart';
import 'package:flutterdemo/providers_repositories/passenger/ride_history_details/ride_history_details_repository.dart';

import '../../../models/rides_json.dart';
import '../../../models/customer_json.dart';

class RideHistoryDetailsProvider with ChangeNotifier {
  late Ride ride;
  late Customer driver;
  late Vehicle vehicle;
  late List<String> passengers = [];

  final RideHistoryDetailsRepository _rideHistoryDetailsRepository =
      MockRideHistoryDetailsRepository();

  bool isFetching = false;
  //called in initState
  fetchRide(String rideId) async {
    isFetching = true;
    notifyListeners();
    ride = await _rideHistoryDetailsRepository.fetchRide(rideId);
    fetchDriver(ride.driverId);
    fetchVehicle(ride.vehicleId);
    for (int i = 0; i<ride.approvedPassengers.length; i++) {
      fetchPassengerName(ride.approvedPassengers[i].passengerId);
    }
    isFetching = false;
    notifyListeners();
  }

  fetchPassengerName(String passengerId) async {
    passengers.add(await _rideHistoryDetailsRepository.fetchPassengerName(passengerId));
  }

  fetchDriver(String driverId) async {
    driver = await _rideHistoryDetailsRepository.fetchDriver(driverId);
  }

  fetchVehicle(String vehicleId) async {
    vehicle = await _rideHistoryDetailsRepository.fetchVehicle(vehicleId);
  }

  updateDriverRating() {
    //Todo: implement updateDriverRating
  }
}
