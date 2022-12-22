import 'package:flutterdemo/models/coordinates.dart';

class ApprovedPassenger {
  ApprovedPassenger({
    required this.passengerId,
    required this.startingDestination,
    required this.endingDestination,
    required this.startingCoordinates,
    required this.endingCoordinates,
    required this.waypoints,
    required this.rideFare,
    required this.driverRating,
    required this.passengerRating,
    required this.isDelete,
  });

  String passengerId;
  String startingDestination;
  String endingDestination;
  Coordinates startingCoordinates;
  Coordinates endingCoordinates;
  List<Coordinates> waypoints;
  int rideFare;
  int driverRating;
  int passengerRating;
  bool isDelete;

  factory ApprovedPassenger.fromJson(Map<String, dynamic> json) =>
      ApprovedPassenger(
        passengerId: json["passengerID"],
        startingCoordinates: Coordinates.fromJson(json["startingCoordinates"]),
        endingCoordinates: Coordinates.fromJson(json["endingCoordinates"]),
        startingDestination: json["startingDestination"],
        endingDestination: json["endingDestination"],
        waypoints: List<Coordinates>.from(
            json["waypoints"].map((x) => Coordinates.fromJson(x))),
        rideFare: json["rideFare"],
        driverRating: json["driverRating"],
        passengerRating: json["passengerRating"],
        isDelete: json["isDelete"],
      );

  Map<String, dynamic> toJson() => {
        "passengerID": passengerId,
        "startingDestination": startingDestination,
        "endingDestination": endingDestination,
        "startingCoordinates": startingCoordinates.toJson(),
        "endingCoordinates": endingCoordinates.toJson(),
        "waypoints": List<dynamic>.from(waypoints.map((x) => x.toJson())),
        "rideFare": rideFare,
        "driverRating": driverRating,
        "passengerRating": passengerRating,
        "isDelete": isDelete,
      };
}
