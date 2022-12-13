import '../../../models/approved_passenger.dart';
import '../../../models/passenger_request.dart';
import '../../../models/rides_json.dart';
import '../../../models/customer_json.dart';
import '../../../models/vehicle_json.dart';

abstract class RideHistoryDetailsRepository {
  Future<Ride> fetchRide(String rideId);
  Future<Customer> fetchDriver(String driverId);
  Future<Vehicle> fetchVehicle(String vehicleId);
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
      isDelete: false, id: '',
    ));
  }

  @override
  Future<Ride> fetchRide(String rideId) async {
    return (Ride(
      id: "${DateTime.now().microsecondsSinceEpoch}aasdasdasd213414",
      driverId: "aasdasdasd213414",
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
}
