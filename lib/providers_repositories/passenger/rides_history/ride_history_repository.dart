import 'package:flutterdemo/models/approved_passenger.dart';

import '../../../models/passenger_request.dart';
import '../../../models/rides_json.dart';

abstract class RideHistoryRepository {
  Future<List<Ride>> fetchRides(String passengerID);
}

class MockRideHistoryRepository implements RideHistoryRepository {
  @override
  Future<List<Ride>> fetchRides(String passengerID) async {
    return ([
      Ride(
        id: "${DateTime.now().microsecondsSinceEpoch}ghjkfghkjfghj546346534",
        driverId: "ghjkfghkjfghj546346534",
        vehicleId: "ABC-123",
        startingCoordinates: "startingCoordinates",
        endingCoordinates: "endingCoordinates",
        totalFare: 123,
        availableSeats: 0,
        isFemaleOnly: false,
        date: DateTime(2022, 12, 13).millisecondsSinceEpoch,
        time: DateTime(0, 0, 0, 17, 30).millisecondsSinceEpoch,
        isCompleted: true,
        approvedPassengers: [
          ApprovedPassenger(
            passengerId: "huzaifa@gmail.com",
            startingCoordinates: "startingCoordinateshuzaifa",
            endingCoordinates: "endingCoordinateshuzaifa",
            rideFare: 200,
            isDelete: false,
            driverRating: -1,
            passengerRating: -1,
          ),
          ApprovedPassenger(
            passengerId: "irtiza@gmail.com",
            startingCoordinates: "startingCoordinatesirtiza",
            endingCoordinates: "endingCoordinatesirtiza",
            rideFare: 200,
            isDelete: false,
            driverRating: -1,
            passengerRating: -1,
          ),
          ApprovedPassenger(
            passengerId: "ibrahim@gmail.com",
            startingCoordinates: "startingCoordinatesibrahim",
            endingCoordinates: "endingCoordinatesibrahim",
            rideFare: 200,
            isDelete: false,
            driverRating: -1,
            passengerRating: -1,
          ),
        ],
        passengerRequests: [
          PassengerRequest(
            passengerId: "hamza@gmail.com",
            startingCoordinates: 'startingCoordinates',
            endingCoordinates: 'startingCoordinates',
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
        startingCoordinates: "startingCoordinates",
        endingCoordinates: "endingCoordinates",
        totalFare: 123,
        availableSeats: 0,
        isFemaleOnly: false,
        date: DateTime(2022, 12, 13).millisecondsSinceEpoch,
        time: DateTime(0, 0, 0, 17, 30).millisecondsSinceEpoch,
        isCompleted: true,
        approvedPassengers: [
          ApprovedPassenger(
            passengerId: "huzaifa@gmail.com",
            startingCoordinates: "startingCoordinateshuzaifa",
            endingCoordinates: "endingCoordinateshuzaifa",
            rideFare: 200,
            isDelete: false,
            driverRating: -1,
            passengerRating: -1,
          ),
          ApprovedPassenger(
            passengerId: "irtiza@gmail.com",
            startingCoordinates: "startingCoordinatesirtiza",
            endingCoordinates: "endingCoordinatesirtiza",
            rideFare: 200,
            isDelete: false,
            driverRating: -1,
            passengerRating: -1,
          ),
          ApprovedPassenger(
            passengerId: "ibrahim@gmail.com",
            startingCoordinates: "startingCoordinatesibrahim",
            endingCoordinates: "endingCoordinatesibrahim",
            rideFare: 200,
            isDelete: false,
            driverRating: -1,
            passengerRating: -1,
          ),
        ],
        passengerRequests: [
          PassengerRequest(
            passengerId: "hamza@gmail.com",
            startingCoordinates: 'startingCoordinates',
            endingCoordinates: 'startingCoordinates',
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
