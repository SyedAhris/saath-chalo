
import 'package:flutter/material.dart';

import 'VehiclesJson.dart';
import 'VehiclesRepository.dart';

class VehiclesProvider with ChangeNotifier {
  List<VehiclesJson> vehicles = [];

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
}