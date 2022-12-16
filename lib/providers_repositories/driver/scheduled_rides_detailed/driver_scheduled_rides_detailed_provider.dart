

import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/providers_repositories/driver/scheduled_rides_detailed/driver_scheduled_rides_detailed_repository.dart';

import '../../../models/customer_json.dart';
import '../../../models/rides_json.dart';
import '../../../models/vehicle_json.dart';

class DriverScheduledRidesDetailedProvider with ChangeNotifier {
  late Ride ride;
  late Customer driver;
  late Vehicle vehicle;
  late List<Customer> passengers = [];

  bool isFetching = false;

  final DriverScheduledRidesDetailedRepository _driverScheduledRidesDetailedRepository = DriverMockScheduledRidesDetailedRepository();

  fetchRide(String rideID) async {
    isFetching = true;
    passengers = [];
    notifyListeners();
    ride = await _driverScheduledRidesDetailedRepository.fetchRide(rideID);
    fetchVehicle(ride.vehicleId);
    fetchDriver(ride.driverId);
    print(ride.approvedPassengers.length);
    for (int i = 0; i<ride.approvedPassengers.length; i++) {
      fetchPassenger(ride.approvedPassengers[i].passengerId);
    }
    isFetching = false;
    notifyListeners();
  }
  fetchVehicle(String vehicleId) async {
    vehicle = await _driverScheduledRidesDetailedRepository.fetchVehicle(vehicleId);
  }

  fetchDriver(String driverId) async {
    driver = await _driverScheduledRidesDetailedRepository.fetchDriver(driverId);
  }

  fetchPassenger(String passengerId) async {
    passengers.add(await _driverScheduledRidesDetailedRepository.fetchPassenger(passengerId));
    print(passengers);
  }

}