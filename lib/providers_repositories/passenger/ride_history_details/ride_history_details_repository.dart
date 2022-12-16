import '../../../models/approved_passenger.dart';
import '../../../models/coordinates.dart';
import '../../../models/passenger_request.dart';
import '../../../models/rides_json.dart';
import '../../../models/customer_json.dart';
import '../../../models/vehicle_json.dart';

abstract class RideHistoryDetailsRepository {
  Future<Ride> fetchRide(String rideId);
  Future<Customer> fetchDriver(String driverId);
  Future<Vehicle> fetchVehicle(String vehicleId);
  Future<String> fetchPassengerName(String passengerId);
  void updateDriverRating(Customer user);
}

class MockRideHistoryDetailsRepository implements RideHistoryDetailsRepository {
  @override
  Future<Customer> fetchDriver(String driverId) async {
    return (Customer(
      firstName: "Syed Muhammad",
      lastName: "Ahris",
      email: "ahrissyed@gmail.com",
      phone: "03343829388",
      password: "hello1234",
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
  Future<Ride> fetchRide(String rideId) async {
    return (Ride(
      id: "${DateTime.now().microsecondsSinceEpoch}aasdasdasd213414",
      driverId: "aasdasdasd213414",
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
          passengerId: "asdasdasda",
          startingCoordinates:  Coordinates(lat: "12.345678", long: "98.765432"),
          endingCoordinates:  Coordinates(lat: "56.345678", long: "54.765432"),
          startingDestination: "startingDestinationHamza",
          endingDestination: "endingDestinationHamza",
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
    ));
  }

  @override
  Future<Vehicle> fetchVehicle(String vehicleId) async {
    return (Vehicle(
        color: "Red",
        make: "Suzuki",
        model: "WagonR",
        year: "2020",
        ac: true,
        carType: "hatchback",
        seatingCapacity: 4,
        imageLink: "imageLink",
        plateNumber: "ABC-123",
        isDelete: false));
  }

  @override
  void updateDriverRating(Customer user) {
    // TODO: implement updateDriverRating
  }

  @override
  Future<String> fetchPassengerName(String passengerId) async {
    return ("Passenger $passengerId");
  }
}
