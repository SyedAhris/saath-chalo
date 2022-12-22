import 'package:cloud_firestore/cloud_firestore.dart';
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
  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Future<List<PassengerHomeListDetails>> searchRides(
      Coordinates startingCoordinates, Coordinates endingCoordinates) async {
    Ride? ride;
    Customer? driver;
    Vehicle? vehicle;
    List<PassengerHomeListDetails> details = [];
    await db
        .collection("Ride")
        .orderBy("date", descending: true)
        .get()
        .then((value) async {
      for (var element in value.docs) {
        ride = Ride.fromJson(element.data());
        DateTime rideDate = DateTime.fromMillisecondsSinceEpoch(ride!.date);
        DateTime rideTime = DateTime.fromMillisecondsSinceEpoch(ride!.time);
        DateTime dateTime = DateTime(rideDate.year, rideDate.month,
            rideDate.day, rideTime.hour, rideTime.minute);
        if (dateTime.isAfter(DateTime.now())) {
          print(startingCoordinates.getDistanceTo(ride!.startingCoordinates));
          print(endingCoordinates.getDistanceTo(ride!.endingCoordinates));
          print(startingCoordinates.lat);
          print(startingCoordinates.long);
          print(ride!.startingCoordinates.lat);
          print(ride!.startingCoordinates.long);
          if (startingCoordinates.getDistanceTo(ride!.startingCoordinates)<5 && endingCoordinates.getDistanceTo(ride!.endingCoordinates)<5) {
            await db
                .collection("Customers")
                .doc(ride!.driverId)
                .get()
                .then((value) {
              driver = Customer.fromJson(value.data()!);
              for (Vehicle veh in driver!.vehicles) {
                if (veh.plateNumber == ride!.vehicleId) {
                  vehicle = veh;
                  details.add(PassengerHomeListDetails(
                      ride: ride!, driver: driver!, vehicle: vehicle!));
                }
              }
            });
          }
        }
      }
    });
    return details;
  }

  @override
  updateRide(Ride ride) {
    db.collection("Ride").doc(ride.id).set(ride.toJson());
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
            rideFare: 400,
            isDelete: false,
            driverRating: -1,
            passengerRating: -1,
          ),
        ],
        passengerRequests: [
          PassengerRequest(
              passengerId: "1245",
              startingCoordinates:
                  Coordinates(lat: "12.345678", long: "98.765432"),
              endingCoordinates:
                  Coordinates(lat: "56.345678", long: "54.765432"),
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
      ),
      vehicle: Vehicle(
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
