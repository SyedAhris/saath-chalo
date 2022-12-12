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
        driverId: "ahrissyed@gmail.com",
        vehicleId: "ABC-123",
        startingCoordinates: "startingCoordinates",
        endingCoordinates: "endingCoordinates",
        totalFare: 123,
        availableSeats: 0,
        isFemaleOnly: false,
        date: "12-12-2000",
        time: "09:00",
        isCompleted: true,
        approvedPassengers: [
          ApprovedPassenger(
            passengerId: "huzaifa@gmail.com",
            startingCoordinates: "startingCoordinateshuzaifa",
            endingCoordinates: "endingCoordinateshuzaifa",
            rideFare: 200,
            isDelete: false,
          ),
          ApprovedPassenger(
            passengerId: "irtiza@gmail.com",
            startingCoordinates: "startingCoordinatesirtiza",
            endingCoordinates: "endingCoordinatesirtiza",
            rideFare: 200,
            isDelete: false,
          ),
          ApprovedPassenger(
            passengerId: "ibrahim@gmail.com",
            startingCoordinates: "startingCoordinatesibrahim",
            endingCoordinates: "endingCoordinatesibrahim",
            rideFare: 200,
            isDelete: false,
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
        driverId: "ahrissyed@gmail.com",
        vehicleId: "ABC-123",
        startingCoordinates: "startingCoordinates",
        endingCoordinates: "endingCoordinates",
        totalFare: 123,
        availableSeats: 0,
        isFemaleOnly: false,
        date: "12-12-2000",
        time: "09:00",
        isCompleted: true,
        approvedPassengers: [
          ApprovedPassenger(
            passengerId: "huzaifa@gmail.com",
            startingCoordinates: "startingCoordinateshuzaifa",
            endingCoordinates: "endingCoordinateshuzaifa",
            rideFare: 200,
            isDelete: false,
          ),
          ApprovedPassenger(
            passengerId: "irtiza@gmail.com",
            startingCoordinates: "startingCoordinatesirtiza",
            endingCoordinates: "endingCoordinatesirtiza",
            rideFare: 200,
            isDelete: false,
          ),
          ApprovedPassenger(
            passengerId: "ibrahim@gmail.com",
            startingCoordinates: "startingCoordinatesibrahim",
            endingCoordinates: "endingCoordinatesibrahim",
            rideFare: 200,
            isDelete: false,
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
