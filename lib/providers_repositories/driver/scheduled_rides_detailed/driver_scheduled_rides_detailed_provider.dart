

import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/providers_repositories/driver/scheduled_rides_detailed/driver_scheduled_rides_detailed_repository.dart';

import '../../../models/customer_json.dart';
import '../../../models/rides_json.dart';
import '../../../models/vehicle_json.dart';

class DriverScheduledRidesDetailedProvider with ChangeNotifier {
  late Ride ride;
  late Customer driver;
  late Vehicle vehicle;

  bool isFetching = false;

  final DriverScheduledRidesDetailedRepository _driverScheduledRidesDetailedRepository = DriverMockScheduledRidesDetailedRepository();

  fetchRide(String rideID) async {
    isFetching = true;
    notifyListeners();
    ride = await _driverScheduledRidesDetailedRepository.fetchRide(rideID);
    fetchVehicle(ride.vehicleId);
    isFetching = false;
    notifyListeners();
  }
  fetchVehicle(String vehicleId) async {
    vehicle = await _driverScheduledRidesDetailedRepository.fetchVehicle(vehicleId);
  }

}