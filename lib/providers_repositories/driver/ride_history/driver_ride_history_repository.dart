import 'package:flutterdemo/models/approved_passenger.dart';

import '../../../models/coordinates.dart';
import '../../../models/passenger_request.dart';
import '../../../models/rides_json.dart';

abstract class DriverRideHistoryRepository {
  Future<List<Ride>> fetchRides(String driverId);
}

class DriverMockRideHistoryRepository implements DriverRideHistoryRepository {
  @override
  Future<List<Ride>> fetchRides(String driverId) async {
    return ([
      Ride(
        id: "${DateTime.now().microsecondsSinceEpoch}ghjkfghkjfghj546346534",
        driverId: "ghjkfghkjfghj546346534",
        vehicleId: "ABC-123",
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
        totalFare: 123,
        availableSeats: 0,
        isFemaleOnly: false,
        date: DateTime(2022, 12, 13).millisecondsSinceEpoch,
        time: DateTime(0, 0, 0, 17, 30).millisecondsSinceEpoch,
        isCompleted: true,
        approvedPassengers: [
          ApprovedPassenger(
            passengerId: "huzaifa@gmail.com",
            startingCoordinates:  Coordinates(lat: "12.345678", long: "98.765432"),
            endingCoordinates:  Coordinates(lat: "56.345678", long: "54.765432"),
            startingDestination: "startingDestinationHuzaifa",
            endingDestination: "endingDestinationHuzaifa",
            waypoints: [
              Coordinates(lat: "12.345678", long: "98.765432"),
              Coordinates(lat: "21.345678", long: "87.765432"),
              Coordinates(lat: "34.345678", long: "76.765432"),
              Coordinates(lat: "45.345678", long: "65.765432"),
              Coordinates(lat: "56.345678", long: "54.765432"),
            ],
            rideFare: 200,
            isDelete: false,
            driverRating: -1,
            passengerRating: -1,
          ),
          ApprovedPassenger(
            passengerId: "irtiza@gmail.com",
            startingCoordinates:  Coordinates(lat: "12.345678", long: "98.765432"),
            endingCoordinates:  Coordinates(lat: "56.345678", long: "54.765432"),
            startingDestination: "startingDestinationIrtiza",
            endingDestination: "endingDestinationIrtiza",
            waypoints: [
              Coordinates(lat: "12.345678", long: "98.765432"),
              Coordinates(lat: "21.345678", long: "87.765432"),
              Coordinates(lat: "34.345678", long: "76.765432"),
              Coordinates(lat: "45.345678", long: "65.765432"),
              Coordinates(lat: "56.345678", long: "54.765432"),
            ],
            rideFare: 200,
            isDelete: false,
            driverRating: -1,
            passengerRating: -1,
          ),
          ApprovedPassenger(
            passengerId: "ibrahim@gmail.com",
            startingCoordinates:  Coordinates(lat: "12.345678", long: "98.765432"),
            endingCoordinates:  Coordinates(lat: "56.345678", long: "54.765432"),
            startingDestination: "startingDestinationIbrahim",
            endingDestination: "endingDestinationIbrahim",
            waypoints: [
              Coordinates(lat: "12.345678", long: "98.765432"),
              Coordinates(lat: "21.345678", long: "87.765432"),
              Coordinates(lat: "34.345678", long: "76.765432"),
              Coordinates(lat: "45.345678", long: "65.765432"),
              Coordinates(lat: "56.345678", long: "54.765432"),
            ],
            rideFare: 200,
            isDelete: false,
            driverRating: -1,
            passengerRating: -1,
          ),
        ],
        passengerRequests: [
          PassengerRequest(
            passengerId: "hasdasdasd12341231",
            startingCoordinates:  Coordinates(lat: "12.345678", long: "98.765432"),
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
            status: 'Rejected',
            isDelete: false,
          ),
        ],
        isDelete: false,
        isRecurring: false,
      ),
      Ride(
        id: "${DateTime.now().microsecondsSinceEpoch}asdfadfg234523asdasd",
        driverId: "asdfadfg234523asdasd",
        vehicleId: "ABC-123",
        startingDestination: "startingCoordinates",
        endingDestination: "endingCoordinates",
        startingCoordinates: Coordinates(
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
        endingCoordinates: Coordinates(
          lat: "123",
          long: "123",
        ),
        totalFare: 123,
        availableSeats: 0,
        isFemaleOnly: false,
        date: DateTime(2022, 12, 13).millisecondsSinceEpoch,
        time: DateTime(0, 0, 0, 17, 30).millisecondsSinceEpoch,
        isCompleted: true,
        approvedPassengers: [
          ApprovedPassenger(
            passengerId: "huzaifa@gmail.com",
            startingCoordinates:  Coordinates(lat: "12.345678", long: "98.765432"),
            endingCoordinates:  Coordinates(lat: "56.345678", long: "54.765432"),
            startingDestination: "startingDestinationHzuaifa",
            endingDestination: "endingDestinationHzuafda",
            waypoints: [
              Coordinates(lat: "12.345678", long: "98.765432"),
              Coordinates(lat: "21.345678", long: "87.765432"),
              Coordinates(lat: "34.345678", long: "76.765432"),
              Coordinates(lat: "45.345678", long: "65.765432"),
              Coordinates(lat: "56.345678", long: "54.765432"),
            ],
            rideFare: 200,
            isDelete: false,
            driverRating: -1,
            passengerRating: -1,
          ),
          ApprovedPassenger(
            passengerId: "irtiza@gmail.com",
            startingCoordinates:  Coordinates(lat: "12.345678", long: "98.765432"),
            endingCoordinates:  Coordinates(lat: "56.345678", long: "54.765432"),
            startingDestination: "startingDestinationIrtiza",
            endingDestination: "endingDestinationIrtiza",
            waypoints: [
              Coordinates(lat: "12.345678", long: "98.765432"),
              Coordinates(lat: "21.345678", long: "87.765432"),
              Coordinates(lat: "34.345678", long: "76.765432"),
              Coordinates(lat: "45.345678", long: "65.765432"),
              Coordinates(lat: "56.345678", long: "54.765432"),
            ],
            rideFare: 200,
            isDelete: false,
            driverRating: -1,
            passengerRating: -1,
          ),
          ApprovedPassenger(
            passengerId: "ibrahim@gmail.com",
            startingCoordinates:  Coordinates(lat: "12.345678", long: "98.765432"),
            endingCoordinates:  Coordinates(lat: "56.345678", long: "54.765432"),
            startingDestination: "startingDestinationIbrahim",
            endingDestination: "endingDestinationIbrahim",
            waypoints: [
              Coordinates(lat: "12.345678", long: "98.765432"),
              Coordinates(lat: "21.345678", long: "87.765432"),
              Coordinates(lat: "34.345678", long: "76.765432"),
              Coordinates(lat: "45.345678", long: "65.765432"),
              Coordinates(lat: "56.345678", long: "54.765432"),
            ],
            rideFare: 200,
            isDelete: false,
            driverRating: -1,
            passengerRating: -1,
          ),
        ],
        passengerRequests: [
          PassengerRequest(
            passengerId: "hamza@gmail.com",
            startingCoordinates:  Coordinates(lat: "12.345678", long: "98.765432"),
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
            status: 'Rejected',
            isDelete: false,
          ),
        ],
        isDelete: false,
        isRecurring: false,
      ),
    ]);
  }
}
