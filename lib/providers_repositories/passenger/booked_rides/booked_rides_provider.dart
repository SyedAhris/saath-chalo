import 'package:flutter/material.dart';
import 'package:flutterdemo/providers_repositories/passenger/booked_rides/booked_rides_repository.dart';

import '../../../models/rides_json.dart';

class BookedRidesProvider with ChangeNotifier {
  List<Ride> approvedRides = [];
  List<Ride> pendingRides = [];
  List<Ride> rejectedRides = [];

  final BookedRidesRepository _passengerBookedRidesRepository = MockPassengerBookedRidesRepository();

  //this function will be called in the initState of the screen then all the functions will be accessible through the created variables.
  fetchRides (String passengerID) async {
    approvedRides = await _passengerBookedRidesRepository.getApprovedRides(passengerID);
    pendingRides = await _passengerBookedRidesRepository.getPendingRides(passengerID);
    rejectedRides = await _passengerBookedRidesRepository.getRejectedRides(passengerID);
    notifyListeners();
  }
}