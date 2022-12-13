import 'package:flutter/material.dart';
import 'package:flutterdemo/models/approved_passenger.dart';

import '../../../models/passenger_request.dart';
import '../../../models/rides_json.dart';
import '../../../models/user_json.dart';
import 'booked_rides_details_repository.dart';

class BookedRidesDetailProvider with ChangeNotifier {
  late Ride ride;
  late Customer driver;

  final BookedRidesDetailsRepository _bookedRidesDetailsRepository = MockBookedRideDetailsRepository();

  fetchRide(String rideID) async{
    ride = await _bookedRidesDetailsRepository.fetchRide(rideID);
  }
  fetchDriver(String driverID) async {
    driver = await _bookedRidesDetailsRepository.fetchDriver(driverID);
  }
  updateApprovedRide(String startingCoordinates, String endingCoordinates, String passengerID){
    List<ApprovedPassenger> req =  ride.approvedPassengers;
    for (int i = 0; i<req.length; i++) {
        if (req[i].passengerId == passengerID) {
          req[i].startingCoordinates = startingCoordinates;
          req[i].endingCoordinates = endingCoordinates;
          _bookedRidesDetailsRepository.updateRide(ride);
          break;
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