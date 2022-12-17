import 'package:flutterdemo/models/coordinates.dart';

import '../../../models/rides_json.dart';

abstract class DriverScheduledRideRepository {
  Future<List<Ride>> getRideNow(String driverId);
  Future<List<Ride>> getUpcomingRide(String driverId);
}

class DriverFirebaseScheduledRideRepository implements DriverScheduledRideRepository {
  @override
  Future<List<Ride>> getRideNow(String driverId) {
    // TODO: implement getApprovedRides
    // get approved rides from rides.approvedpassenger.where(passengerID=passebngerID)
    throw UnimplementedError();
  }

  @override
  Future<List<Ride>> getUpcomingRide(String driverId) {
    // TODO: implement getBookedRides
    throw UnimplementedError();
  }

}

class DriverMockScheduledRidesRepository implements DriverScheduledRideRepository {
  @override
  Future<List<Ride>> getRideNow(String driverId) async {
    return [
      Ride(
        id: DateTime.now().microsecondsSinceEpoch.toString() + "asdw1324asd",
        driverId: "asdw1324asd",
        vehicleId: "ABC-123",
        startingDestination: "startingCoordinatesApproved",
        endingDestination: "endingCoordinatesApproved",
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
        totalFare: 1234,
        availableSeats: 4,
        isFemaleOnly: false,
        date: DateTime(2022, 12, 13).millisecondsSinceEpoch,
        time: DateTime(0, 0, 0, 17, 30).millisecondsSinceEpoch,
        isDelete: false,
        isCompleted: false,
        isRecurring: false,
      ),
    ];
  }

  @override
  Future<List<Ride>> getUpcomingRide(String driverId) async {
    return [
      Ride(
        id: DateTime.now().microsecondsSinceEpoch.toString() +
            "salfgihasopifj3",
        driverId: "salfgihasopifj3",
        vehicleId: "ABC-123",
        startingDestination: "startingCoordinatesPending",
        endingDestination: "endingCoordinatesPending",
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
        totalFare: 1234,
        availableSeats: 4,
        isFemaleOnly: false,
        date: DateTime(2022, 12, 13).millisecondsSinceEpoch,
        time: DateTime(0, 0, 0, 17, 30).millisecondsSinceEpoch,
        isDelete: false,
        isCompleted: false,
        isRecurring: false,
      ),
    ];
  }
}
