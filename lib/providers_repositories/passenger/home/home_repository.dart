import 'package:flutterdemo/models/approved_passenger.dart';
import 'package:flutterdemo/models/passenger_request.dart';
import 'package:flutterdemo/models/customer_json.dart';
import 'package:flutterdemo/providers_repositories/passenger/home/home_provider.dart';

import '../../../models/coordinates.dart';
import '../../../models/rides_json.dart';
import '../../../models/vehicle_json.dart';

abstract class PassengerHomeRepository {
  Future<List<PassengerHomeListDetails>> searchRides(
      Coordinates startingCoordinates, Coordinates endingCoordinates);
  updateRide(Ride ride);

}

class FirebasePassengerHomeRepository implements PassengerHomeRepository {
  @override
  Future<List<PassengerHomeListDetails>> searchRides(
      Coordinates startingCoordinates, Coordinates endingCoordinates) {
    // TODO: implement searchRides
    // TODO: using google maps
    throw UnimplementedError();
  }

  @override
  updateRide(Ride ride) {
    // TODO: implement updateRide
    throw UnimplementedError();
  }
}

class MockPassengerHomeRepository implements PassengerHomeRepository {
  List<PassengerHomeListDetails> rides = [
    PassengerHomeListDetails(
      ride: Ride(
        id: "${DateTime.now().microsecondsSinceEpoch}1231",
        driverId: "1231",
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
        totalFare: 1200,
        availableSeats: 3,
        isFemaleOnly: false,
        date: DateTime(2022, 12, 13).millisecondsSinceEpoch,
        time: DateTime(0, 0, 0, 17, 30).millisecondsSinceEpoch,
        approvedPassengers: [
          ApprovedPassenger(
            passengerId: "52345",
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
            rideFare: 400,
            isDelete: false,
            driverRating: -1,
            passengerRating: -1,
          ),
        ],
        passengerRequests: [
          PassengerRequest(
              passengerId: "1245",
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
              status: "Pending",
              isDelete: false),
        ],
        isDelete: false,
        isCompleted: false,
        isRecurring: false,
      ),
      driver: Customer(
        firstName: "Syed",
        lastName: "Ahris",
        email: "ahrissyed@gmail.com",
        phone: "03343829388",
        password: "asdasdasdasd",
        rating: 4.5,
        profilePictureLink: "ASdasdasdasd",
        gender: "M",
        isDriver: true,
        isPassenger: false,
        isDelete: false,
        id: '',
      ), vehicle: Vehicle(
        color: "Red",
        make: "Suzuki",
        model: "WagonR",
        year: "2020",
        ac: true,
        carType: "hatchback",
        seatingCapacity: 4,
        imageLink: "imageLink",
        plateNumber: "ABC-123",
        isDelete: false),
    )
  ];
  @override
  Future<List<PassengerHomeListDetails>> searchRides(
      Coordinates startingCoordinates, Coordinates endingCoordinates) async {
    return rides;
  }

  @override
  updateRide(Ride ride) {
    //TODO: send firebasereq
  }
}
