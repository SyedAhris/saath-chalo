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
          availableSeats: 2,
          isFemaleOnly: false,
          date: "12-12-2000",
          time: "09:00",
          isCompleted: true,
          passengerRequests: [
            PassengerRequest(
              passengerId: '',
              startingCoordinates: '',
              endingCoordinates: '',
              status: '',
              isDelete: false,
            ),
          ],
          isDelete: false)
    ]);
  }
}
