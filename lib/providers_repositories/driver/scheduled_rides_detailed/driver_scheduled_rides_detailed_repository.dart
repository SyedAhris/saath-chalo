import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/approved_passenger.dart';
import '../../../models/coordinates.dart';
import '../../../models/customer_json.dart';
import '../../../models/passenger_request.dart';
import '../../../models/rides_json.dart';
import '../../../models/vehicle_json.dart';

abstract class DriverScheduledRidesDetailedRepository {
  Future<Ride> fetchRide(String rideID);
  Future<Vehicle> fetchVehicle(String vehicleId, String driverId);
  Future<Customer> fetchDriver(String driverID);
  Future<Customer> fetchPassenger(passengerId);
}

class DriverFirebaseScheduledRidesDetailedRepository
    implements DriverScheduledRidesDetailedRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<Ride> fetchRide(String rideID) async {
    Ride? ride;
    await db.collection("Ride").doc(rideID).get().then((value) {
      ride = Ride.fromJson(value.data() ?? {});
    });
    return ride as Ride;
  }

  @override
  Future<Vehicle> fetchVehicle(String vehicleId, String driverId) async {
    Vehicle? vehicle;
    print(driverId);
    await db.collection("Customers").doc(driverId).get().then((event) {
      Customer customer = Customer.fromJson(event.data() ?? {});
      for (Vehicle veh in customer.vehicles) {
        if (veh.plateNumber == vehicleId) {
          vehicle = veh;
        }
      }
    });
    return vehicle as Vehicle;
  }

  @override
  Future<Customer> fetchDriver(String driverID) async {
    Customer? driver;
    await db.collection("Customers").doc(driverID).get().then((value) {
      driver = Customer.fromJson(value.data() ?? {});
    });
    return driver as Customer;
  }

  @override
  Future<Customer> fetchPassenger(passengerId) async {
    Customer? passenger;
    await db.collection("Customer").doc(passengerId).get().then((value) {
      passenger = Customer.fromJson(value.data() ?? {});
    });
    return passenger as Customer;
  }
}

class DriverMockScheduledRidesDetailedRepository
    implements DriverScheduledRidesDetailedRepository {
  @override
  Future<Customer> fetchDriver(String driverID) async {
    return (Customer(
      firstName: "Syed Muhammad",
      lastName: "Ahris",
      email: "ahrissyed@gmail.com",
      phone: "phone",
      password: "password",
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
      approvedPassengers: [
        ApprovedPassenger(
          passengerId: "huzaifa@gmail.com",
          startingCoordinates: Coordinates(lat: "12.345678", long: "98.765432"),
          endingCoordinates: Coordinates(lat: "56.345678", long: "54.765432"),
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
          startingCoordinates: Coordinates(lat: "12.345678", long: "98.765432"),
          endingCoordinates: Coordinates(lat: "56.345678", long: "54.765432"),
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
          startingCoordinates: Coordinates(lat: "12.345678", long: "98.765432"),
          endingCoordinates: Coordinates(lat: "56.345678", long: "54.765432"),
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
            passengerId: '',
            startingCoordinates:
                Coordinates(lat: "12.345678", long: "98.765432"),
            endingCoordinates: Coordinates(lat: "56.345678", long: "54.765432"),
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
  Future<Vehicle> fetchVehicle(String vehicleId, String driverId) async {
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

  @override
  Future<Customer> fetchPassenger(passengerId) async {
    return Customer(
        id: passengerId,
        firstName: passengerId,
        lastName: "Ahris",
        email: "ahrissyed@gmail.com",
        phone: "03343829388",
        password: "password",
        rating: 4.5,
        profilePictureLink: "profilePictureLink",
        gender: "M",
        isDriver: false,
        isPassenger: true,
        isDelete: false);
  }
}
