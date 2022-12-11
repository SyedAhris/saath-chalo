import 'package:flutter/material.dart';
import 'package:flutterdemo/models/approved_passenger.dart';

import '../../../models/passenger_request.dart';
import '../../../models/rides_json.dart';
import '../../../models/user_json.dart';
import 'booked_rides_details_repository.dart';

class BookedRidesDetailProvider with ChangeNotifier {
  late Ride ride;
  late User driver;

  final BookedRidesDetailsRepository _bookedRidesDetailsRepository = MockBookedRideDetailsRepository();

  fetchRide(String rideID) async{
  }
  fetchDriver(String driverID) async {

  }
  updateApprovedRide(String startingCoordinates, String endingCoordinates, String passengerID){
    List<ApprovedPassenger> req =  ride.approvedPassengers;
    for (int i = 0; i<req.length; i++) {
        if (req[i].passengerId == passengerID) {
          req[i].startingCoordinates = startingCoordinates;
          req[i].endingCoordinates = endingCoordinates;
          break;
          //TODO: send req to firebase to update the ride
        }
    }
    notifyListeners();
  }
  updatePendingRide(String startingCoordinates, String endingCoordinates, String passengerID){
    List<PassengerRequest> req =  ride.passengerRequests;
    for (int i = 0; i<req.length; i++) {
      if (req[i].passengerId == passengerID) {
        req[i].startingCoordinates = startingCoordinates;
        req[i].endingCoordinates = endingCoordinates;
        break;
        //TODO: send req to firebase to update the ride
      }
    }
    notifyListeners();
  }
}