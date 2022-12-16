

import '../../../models/coordinates.dart';
import '../../../models/passenger_request.dart';
import '../../../models/rides_json.dart';
import '../../../models/vehicle_json.dart';

abstract class DriverScheduledRidesDetailedRepository {
  Future<Ride> fetchRide(String rideID);
  Future<Vehicle> fetchVehicle(String vehicleID);
}

class DriverMockScheduledRidesDetailedRepository implements DriverScheduledRidesDetailedRepository {

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
      waypoints: [
        Coordinates(lat: "12.345678", long: "98.765432"),
        Coordinates(lat: "21.345678", long: "87.765432"),
        Coordinates(lat: "34.345678", long: "76.765432"),
        Coordinates(lat: "45.345678", long: "65.765432"),
        Coordinates(lat: "56.345678", long: "54.765432"),
      ],
      totalFare: 2344,
      availableSeats: 3,
      isFemaleOnly: false,
      date: DateTime(2022, 12, 13).millisecondsSinceEpoch,
      time: DateTime(0, 0, 0, 17, 30).millisecondsSinceEpoch,
      passengerRequests: [
        PassengerRequest(
            passengerId: '',
            startingCoordinates: Coordinates(lat: "12.345678", long: "98.765432"),
            endingCoordinates:  Coordinates(lat: "56.345678", long: "54.765432"),
            startingDestination: "startingDestination",
            endingDestination: "endingDestination",
            waypoints: [
              Coordinates(lat: "12.345678", long: "98.765432"),
              Coordinates(lat: "21.345678", long: "87.765432"),
              Coordinates(lat: "34.345678", long: "76.765432"),
              Coordinates(lat: "45.345678", long: "65.765432"),
              Coordinates(lat: "56.345678", long: "54.765432"),
            ],
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
