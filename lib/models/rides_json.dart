// To parse this JSON data, do
//
//     final ride = rideFromJson(jsonString);

import 'package:flutterdemo/models/coordinates.dart';
import 'package:flutterdemo/models/passenger_request.dart';
import 'dart:convert';

import 'approved_passenger.dart';

Ride rideFromJson(String str) => Ride.fromJson(json.decode(str));

String rideToJson(Ride data) => json.encode(data.toJson());

class Ride {
  Ride({
    required this.id,
    required this.driverId,
    required this.vehicleId,
    required this.startingDestination,
    required this.endingDestination,
    required this.startingCoordinates,
    required this.endingCoordinates,
    required this.waypoints,
    required this.totalFare,
    required this.availableSeats,
    this.approvedPassengers = const [],
    this.passengerRequests = const [],
    this.isFemaleOnly = false,
    required this.date,
    required this.time,
    required this.isCompleted,
    this.isRecurring = false,
    this.recurringDays = const [],
    this.recurringEndDate = -1,
    required this.isDelete,
  });

  String id;
  String driverId;
  String vehicleId;
  String startingDestination;
  String endingDestination;
  Coordinates startingCoordinates;
  Coordinates endingCoordinates;
  List<Coordinates> waypoints;
  int totalFare;
  int availableSeats;
  List<ApprovedPassenger> approvedPassengers;
  List<PassengerRequest> passengerRequests;
  bool isFemaleOnly;
  int date;
  int time;
  bool isCompleted;
  bool isRecurring;
  List<String> recurringDays;
  int recurringEndDate;
  bool isDelete;

  factory Ride.fromJson(Map<String, dynamic> json) => Ride(
        id: json["id"],
        driverId: json["driverID"],
        vehicleId: json["vehicleID"],
        startingDestination: json["startingDestination"],
        endingDestination: json["endingDestination"],
        startingCoordinates: Coordinates.fromJson(json["startingCoordinates"]),
        endingCoordinates: Coordinates.fromJson(json["endingCoordinates"]),
        waypoints: List<Coordinates>.from(
            json["waypoints"].map((x) => Coordinates.fromJson(x))),
        totalFare: json["totalFare"],
        availableSeats: json["availableSeats"],
        approvedPassengers: List<ApprovedPassenger>.from(
            json["approvedPassengers"]
                .map((x) => ApprovedPassenger.fromJson(x))),
        passengerRequests: List<PassengerRequest>.from(
            json["passengerRequests"].map((x) => PassengerRequest.fromJson(x))),
        isFemaleOnly: json["isFemaleOnly"],
        date: json["date"],
        time: json["time"],
        isCompleted: json["isCompleted"],
        isRecurring: json["isRecurring"],
        recurringEndDate: json["recurringEndDate"],
        recurringDays: List<String>.from(json["recurringDays"].map((x) => x)),
        isDelete: json["isDelete"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "driverID": driverId,
        "vehicleID": vehicleId,
        "startingDestination": startingDestination,
        "endingDestination": endingDestination,
        "startingCoordinates": startingCoordinates.toJson(),
        "endingCoordinates": endingCoordinates.toJson(),
        "waypoints": List<dynamic>.from(waypoints.map((x) => x.toJson())),
        "totalFare": totalFare,
        "availableSeats": availableSeats,
        "approvedPassengers":
            List<dynamic>.from(approvedPassengers.map((x) => x.toJson())),
        "passengerRequests":
            List<dynamic>.from(passengerRequests.map((x) => x.toJson())),
        "isFemaleOnly": isFemaleOnly,
        "date": date,
        "time": time,
        "isCompleted": isCompleted,
        "isRecurring": isRecurring,
        "recurringDays": List<dynamic>.from(recurringDays.map((x) => x)),
        "recurringEndDate": recurringEndDate,
        "isDelete": isDelete,
      };
}
