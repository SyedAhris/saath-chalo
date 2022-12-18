

import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/models/customer_json.dart';
import 'package:flutterdemo/providers_repositories/passenger/home/home_repository.dart';

import '../../../models/coordinates.dart';
import '../../../models/passenger_request.dart';
import '../../../models/rides_json.dart';
import '../../../models/vehicle_json.dart';


class PassengerHomeProvider with ChangeNotifier {
  List<PassengerHomeListDetails> details = [];

  final PassengerHomeRepository _passengerHomeRepository = FirebasePassengerHomeRepository();

  void getSearchedRides(Coordinates startingCoordinates, Coordinates endingCoordinates) async {
    details = await _passengerHomeRepository.searchRides(startingCoordinates, endingCoordinates);
    notifyListeners();
  }

  sendRequest(PassengerRequest pr, Ride ride) async {
    ride.passengerRequests.add(pr);
    await _passengerHomeRepository.updateRide(ride);
    notifyListeners();
  }
}


class PassengerHomeListDetails {
  PassengerHomeListDetails({
    required this.ride,
    required this.driver,
    required this.vehicle,

  });

  Ride ride;
  Customer driver;
  Vehicle vehicle;
}