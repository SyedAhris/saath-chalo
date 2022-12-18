

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
    //TODO: connect with repository
    details = await _passengerHomeRepository.searchRides(startingCoordinates, endingCoordinates);
    notifyListeners();
  }

  sendRequest(int index, Coordinates startingCoordinates, Coordinates endingCoordinates, String currentUserID) async {
    PassengerRequest req = PassengerRequest(
      passengerId: currentUserID,
      startingCoordinates: startingCoordinates,
      endingCoordinates: endingCoordinates,
      startingDestination: "startingDestination",
      endingDestination: "endingDestination",
      waypoints: [
        Coordinates(lat: "12.345678", long: "98.765432"),
        Coordinates(lat: "21.345678", long: "87.765432"),
        Coordinates(lat: "34.345678", long: "76.765432"),
        Coordinates(lat: "45.345678", long: "65.765432"),
        Coordinates(lat: "56.345678", long: "54.765432"),
      ],
      status: "Pending",
      isDelete: false,
    );
    details[index].ride.passengerRequests.add(req);
    _passengerHomeRepository.updateRide(details[index].ride);
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