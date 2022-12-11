import '../../../models/rides_json.dart';

abstract class PassengerBookedRidesRepository {
  Future<List<Ride>> getApprovedRides(String passengerID);
  Future<List<Ride>> getPendingRides(String passengerID);
  Future<List<Ride>> getRejectedRides(String passengerID);
}

class FirebasePassengerBookedRidesRepository
    implements PassengerBookedRidesRepository {
  @override
  Future<List<Ride>> getApprovedRides(String passengerID) {
    // TODO: implement getApprovedRides
    // get approved rides from rides.approvedpassenger.where(passengerID=passebngerID)
    throw UnimplementedError();
  }

  @override
  Future<List<Ride>> getPendingRides(String passengerID) {
    // TODO: implement getBookedRides
    throw UnimplementedError();
  }

  @override
  Future<List<Ride>> getRejectedRides(String passengerID) {
    // TODO: implement getRejectedRides
    throw UnimplementedError();
  }
}

class MockPassengerBookedRidesRepository
    implements PassengerBookedRidesRepository {
  @override
  Future<List<Ride>> getApprovedRides(String passengerID) async {
    return [
      Ride(
          driverId: "asdw1324asd",
          vehicleId: "ABC-123",
          startingCoordinates: "startingCoordinatesApproved",
          endingCoordinates: "endingCoordinatesApproved",
          totalFare: 1234,
          availableSeats: 4,
          isFemaleOnly: false,
          date: "12-12-2022",
          time: "17:00",
          isDelete: false),
    ];
  }

  @override
  Future<List<Ride>> getPendingRides(String passengerID) async {
    return [
      Ride(
          driverId: "asdw1324asd",
          vehicleId: "ABC-123",
          startingCoordinates: "startingCoordinatesPending",
          endingCoordinates: "endingCoordinatesPending",
          totalFare: 1234,
          availableSeats: 4,
          isFemaleOnly: false,
          date: "12-12-2022",
          time: "17:00",
          isDelete: false),
    ];
  }

  @override
  Future<List<Ride>> getRejectedRides(String passengerID) async {
    return [
      Ride(
          driverId: "asdw1324asd",
          vehicleId: "ABC-123",
          startingCoordinates: "startingCoordinatesPending",
          endingCoordinates: "endingCoordinatesPending",
          totalFare: 1234,
          availableSeats: 4,
          isFemaleOnly: false,
          date: "12-12-2022",
          time: "17:00",
          isDelete: false),
    ];
  }
}
