import 'package:flutterdemo/models/passenger_request.dart';

import '../../../models/rides_json.dart';
import '../../../models/user_json.dart';

abstract class BookedRidesDetailsRepository {
  Future<Ride> fetchRide(String rideID);
  Future<User> fetchDriver(String driverID);
  updateRide(Ride ride);
}

class MockBookedRideDetailsRepository implements BookedRidesDetailsRepository {
  @override
  Future<User> fetchDriver(String driverID) async {
    return  (User(
      firstName: "Syed Muhammad",
      lastName: "Ahris",
      email: "ahrissyed@gmail.com",
      phone: "phone",
      password: "password",
      rating: 4.5,
      profilePictureLink: "profilePictureLink",
      gender: "M",
      isDriver: true,
      isPassenger: false,
      isDelete: false,
    ));
  }

  @override
  Future<Ride> fetchRide(String rideID) async {
    return (Ride(
        driverId: "driverId",
        vehicleId: "vehicleId",
        startingCoordinates: "startingCoordinates",
        endingCoordinates: "endingCoordinates",
        totalFare: 2344,
        availableSeats: 3,
        isFemaleOnly: false,
        date: "date",
        time: "time",
        passengerRequests: [
          PassengerRequest(
              passengerId: '',
              startingCoordinates: '',
              endingCoordinates: '',
              status: '',
              isDelete: false),
        ],
        isDelete: false,
        isCompleted: false));
  }

  @override
  updateRide(Ride ride) {
    //TODO: Send Req to firebase to upd
  }
}
