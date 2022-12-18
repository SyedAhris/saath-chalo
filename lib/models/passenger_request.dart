import 'package:flutterdemo/models/coordinates.dart';

class PassengerRequest {
  PassengerRequest({
    required this.passengerId,
    required this.startingDestination,
    required this.endingDestination,
    required this.startingCoordinates,
    required this.endingCoordinates,
    required this.waypoints,
    required this.status,
    required this.isDelete,
  });

  String passengerId;
  String startingDestination;
  String endingDestination;
  Coordinates startingCoordinates;
  Coordinates endingCoordinates;
  List<Coordinates> waypoints;
  String status;
  bool isDelete;

  factory PassengerRequest.fromJson(Map<String, dynamic> json) =>
      PassengerRequest(
        passengerId: json["passengerID"],
        startingDestination: json["startingDestination"],
        endingDestination: json["endingDestination"],
        startingCoordinates: Coordinates.fromJson(json["startingCoordinates"]),
        endingCoordinates: Coordinates.fromJson(json["endingCoordinates"]),
        waypoints: List<Coordinates>.from(
            json["waypoints"].map((x) => Coordinates.fromJson(x))),
        status: json["status"],
        isDelete: json["isDelete"],
      );

  Map<String, dynamic> toJson() => {
        "passengerID": passengerId,
        "startingDestination": startingDestination,
        "endingDestination": endingDestination,
        "startingCoordinates": startingCoordinates.toJson(),
        "endingCoordinates": endingCoordinates.toJson(),
        "waypoints": List<dynamic>.from(waypoints.map((x) => x.toJson())),
        "status": status,
        "isDelete": isDelete,
      };
}
