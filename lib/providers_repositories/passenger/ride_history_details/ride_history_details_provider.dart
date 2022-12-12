import 'package:flutter/material.dart';
import 'package:flutterdemo/models/vehicle_json.dart';
import 'package:flutterdemo/providers_repositories/passenger/ride_history_details/ride_history_details_repository.dart';

import '../../../models/rides_json.dart';
import '../../../models/user_json.dart';

class RideHistoryDetailsProvider with ChangeNotifier {
  late Ride ride;
  late User driver;
  late Vehicle vehicle;

  final RideHistoryDetailsRepository _rideHistoryDetailsRepository = MockRideHistoryDetailsRepository();

  fetchRide(String rideId) async {
    ride = await _rideHistoryDetailsRepository.fetchRide(rideId);
    fetchDriver(ride.driverId);
    fetchVehicle(ride.vehicleId);
    notifyListeners();
  }
  fetchDriver(String driverId) async {
    driver = await _rideHistoryDetailsRepository.fetchDriver(driverId);
  }
  fetchVehicle(String vehicleId) async {
    vehicle = await _rideHistoryDetailsRepository.fetchVehicle(vehicleId);
  }
  updateDriverRating(){
    //Todo: implement updateDriverRating
  }
}