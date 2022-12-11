import 'package:flutter/material.dart';

import '../../../models/rides_json.dart';

class RideHistoryProvider with ChangeNotifier {
  List<Ride> rides = [];

  //would be called in initState of rideHistory Screen
  fetchRide(String passengerID) async {
    //TODO: add
    rides = [];
  }
}