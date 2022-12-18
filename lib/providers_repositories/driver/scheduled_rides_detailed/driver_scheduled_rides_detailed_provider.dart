import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/providers_repositories/driver/scheduled_rides_detailed/driver_scheduled_rides_detailed_repository.dart';

import '../../../models/coordinates.dart';
import '../../../models/customer_json.dart';
import '../../../models/rides_json.dart';
import '../../../models/vehicle_json.dart';

class DriverScheduledRidesDetailedProvider with ChangeNotifier {
  Ride ride = Ride(
    id: '',
    driverId: '',
    vehicleId: '',
    startingDestination: '',
    endingDestination: '',
    startingCoordinates: Coordinates(lat: "0", long: "0"),
    endingCoordinates: Coordinates(lat: "0", long: "0"),
    waypoints: [],
    totalFare: -1,
    availableSeats: -1,
    date: -1,
    time: -1,
    isCompleted: false,
    isDelete: false,
  );
  late Customer driver;
  Vehicle vehicle = Vehicle();
  late List<Customer> passengers = [];

  bool isFetching = false;

  final DriverScheduledRidesDetailedRepository
      _driverScheduledRidesDetailedRepository =
      DriverFirebaseScheduledRidesDetailedRepository();

  fetchRide(String rideID) async {
    isFetching = true;
    passengers = [];
    notifyListeners();
    ride = await _driverScheduledRidesDetailedRepository.fetchRide(rideID);
    await fetchVehicle(ride.vehicleId, ride.driverId);
    await fetchDriver(ride.driverId);
    print(ride.approvedPassengers.length);
    for (int i = 0; i < ride.approvedPassengers.length; i++) {
      fetchPassenger(ride.approvedPassengers[i].passengerId);
    }
    isFetching = false;
    notifyListeners();
  }

  fetchVehicle(String vehicleId, String driverId) async {
    vehicle =
        await _driverScheduledRidesDetailedRepository.fetchVehicle(vehicleId, driverId);
  }

  fetchDriver(String driverId) async {
    driver =
        await _driverScheduledRidesDetailedRepository.fetchDriver(driverId);
  }

  fetchPassenger(String passengerId) async {
    passengers.add(await _driverScheduledRidesDetailedRepository
        .fetchPassenger(passengerId));
    print(passengers);
  }
}
