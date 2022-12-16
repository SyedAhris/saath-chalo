import 'package:flutterdemo/models/passenger_request.dart';
import 'package:flutterdemo/models/vehicle_json.dart';

import '../../../models/coordinates.dart';
import '../../../models/rides_json.dart';
import '../../../models/customer_json.dart';

abstract class BookedRidesDetailsRepository {
  Future<Ride> fetchRide(String rideID);
  Future<Customer> fetchDriver(String driverID);
  Future<Vehicle> fetchVehicle(String vehicleID);
  updateRide(Ride ride);
}

class MockBookedRideDetailsRepository implements BookedRidesDetailsRepository {
  @override
  Future<Customer> fetchDriver(String driverID) async {
    return (Customer(
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
      id: '',
    ));
  }

  @override
  Future<Ride> fetchRide(String rideID) async {
    return (Ride(
      id: "${DateTime.now().microsecondsSinceEpoch}driverId",
      driverId: "driverId",
      vehicleId: "vehicleId",
      startingDestination: "startingCoordinates",
      endingDestination: "endingCoordinates",
      startingCoordinates: Coordinates(
        lat: "123",
        long: "123",
      ),
      endingCoordinates: Coordinates(
        lat: "123",
        long: "123",
      ),
      totalFare: 2344,
      availableSeats: 3,
      isFemaleOnly: false,
      date: DateTime(2022, 12, 13).millisecondsSinceEpoch,
      time: DateTime(0, 0, 0, 17, 30).millisecondsSinceEpoch,
      passengerRequests: [
        PassengerRequest(
            passengerId: '',
            startingCoordinates: '',
            endingCoordinates: '',
            status: '',
            isDelete: false),
      ],
      isDelete: false,
      isCompleted: false,
      isRecurring: false,
    ));
  }

  @override
  updateRide(Ride ride) {
    //TODO: Send Req to firebase to upd
  }

  @override
  Future<Vehicle> fetchVehicle(String vehicleID) async {
    return (Vehicle(
      color: "Black",
      make: "Suzuki",
      model: "WagonR",
      year: "2020",
      ac: false,
      carType: "hatchback",
      seatingCapacity: 4,
      imageLink: "",
      plateNumber: "ABC-123",
      isDelete: false,
    ));
  }
}
