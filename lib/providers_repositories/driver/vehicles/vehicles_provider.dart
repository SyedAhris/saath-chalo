
import 'package:flutter/material.dart';
import 'package:flutterdemo/models/vehicle_json.dart';

import 'vehicles_repository.dart';

class VehiclesProvider with ChangeNotifier {
  List<Vehicle> vehicles = [];

  //create firebase vehicle repository's instance
  final VehiclesRepository _vehiclesRepository = MockVehiclesRepository();

  bool isVehiclesFetching = false;

  void fetchVehicles() async {
    //add vehicles repository
    isVehiclesFetching = true;
    notifyListeners();
    vehicles = await _vehiclesRepository.fetchUsersList();
    isVehiclesFetching = false;
    notifyListeners();
  }

  void addVehicles(Vehicle vehicle) async {
    _vehiclesRepository.addVehicle(vehicle);
  }
}