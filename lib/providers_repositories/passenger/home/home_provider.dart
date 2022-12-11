import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/models/user_json.dart';
import 'package:flutterdemo/providers_repositories/passenger/home/home_repository.dart';

import '../../../models/passenger_request.dart';
import '../../../models/rides_json.dart';


class PassengerHomeProvider with ChangeNotifier {
  List<PassengerHomeListDetails> details = [];

  final PassengerHomeRepository _passengerHomeRepository = MockPassengerHomeRepository();

  void getSearchedRides(String startingCoordinates, String endingCoordinates) async {
    //TODO: connect with repository
    details = await _passengerHomeRepository.searchRides(startingCoordinates, endingCoordinates);
    notifyListeners();
  }

  sendRequest(int index, String startingCoordinates, String endingCoordinates, String currentUserID) async {
    PassengerRequest req = PassengerRequest(
      passengerId: currentUserID,
      startingCoordinates: startingCoordinates,
      endingCoordinates: endingCoordinates,
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
  });

  Ride ride;
  User driver;
}