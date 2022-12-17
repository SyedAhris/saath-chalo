import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdemo/models/coordinates.dart';

import '../../../models/rides_json.dart';

abstract class DriverScheduledRideRepository {
  Future<List<Ride>> getRideNow(String driverId);
  Future<List<Ride>> getUpcomingRide(String driverId);
}

class DriverFirebaseScheduledRideRepository implements DriverScheduledRideRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Future<List<Ride>> getRideNow(String driverId) async {
    List<Ride> rides = [];
    await db.collection("Ride").where("driverID", isEqualTo: driverId).get().then((value) {
      rides = value.docs.map((e) => Ride.fromJson(e.data())).toList();
      print(value.docs[0].data().toString());
    });

    return rides;
  }

  @override
  Future<List<Ride>> getUpcomingRide(String driverId) async {
    List<Ride> rides = [];
    await db.collection("Ride").where("driverId", isEqualTo: driverId).where("isCompleted", isEqualTo: false).where("isDeleted", isEqualTo: false).get().then((value) {
      rides = value.docs.map((e) => Ride.fromJson(e.data())).toList();
    });

    return rides;
  }

}

class DriverMockScheduledRidesRepository implements DriverScheduledRideRepository {
  @override
  Future<List<Ride>> getRideNow(String driverId) async {
    return [
      Ride(
        id: DateTime.now().microsecondsSinceEpoch.toString() + "asdw1324asd",
        driverId: "asdw1324asd",
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
        totalFare: 1234,
        availableSeats: 4,
        isFemaleOnly: false,
        date: DateTime(2022, 12, 13).millisecondsSinceEpoch,
        time: DateTime(0, 0, 0, 17, 30).millisecondsSinceEpoch,
        isDelete: false,
        isCompleted: false,
        isRecurring: false,
      ),
    ];
  }

  @override
  Future<List<Ride>> getUpcomingRide(String driverId) async {
    return [
      Ride(
        id: DateTime.now().microsecondsSinceEpoch.toString() +
            "salfgihasopifj3",
        driverId: "salfgihasopifj3",
        vehicleId: "ABC-123",
        startingDestination: "startingCoordinatesPending",
        endingDestination: "endingCoordinatesPending",
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
        totalFare: 1234,
        availableSeats: 4,
        isFemaleOnly: false,
        date: DateTime(2022, 12, 13).millisecondsSinceEpoch,
        time: DateTime(0, 0, 0, 17, 30).millisecondsSinceEpoch,
        isDelete: false,
        isCompleted: false,
        isRecurring: false,
      ),
    ];
  }
}
