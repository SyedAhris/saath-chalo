import 'package:flutter/material.dart';
import 'package:flutterdemo/providers_repositories/passenger/rides_history/ride_history_repository.dart';

import '../../../models/rides_json.dart';

class RideHistoryProvider with ChangeNotifier {
  List<Ride> rides = [];

  final RideHistoryRepository _rideHistoryRepository = MockRideHistoryRepository();
  //would be called in initState of rideHistory Screen
  fetchRide(String passengerID) async {
    rides = await _rideHistoryRepository.fetchRides(passengerID);
    notifyListeners();
  }
}