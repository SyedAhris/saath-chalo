// To parse this JSON data, do
//
//     final ride = rideFromJson(jsonString);

import 'package:flutterdemo/models/passenger_request.dart';
import 'dart:convert';

import 'approved_passenger.dart';

Ride rideFromJson(String str) => Ride.fromJson(json.decode(str));

String rideToJson(Ride data) => json.encode(data.toJson());

class Ride {
  Ride({
    required this.driverId,
    required this.vehicleId,
    required this.startingCoordinates,
    required this.endingCoordinates,
    required this.totalFare,
    required this.availableSeats,
    this.approvedPassengers = const [],
    this.passengerRequests = const [],
    required this.isFemaleOnly,
    required this.date,
    required this.time,
    required this.isCompleted,
    required this.isDelete,
  });

  String driverId;
  String vehicleId;
  String startingCoordinates;
  String endingCoordinates;
  int totalFare;
  int availableSeats;
  List<ApprovedPassenger> approvedPassengers;
  List<PassengerRequest> passengerRequests;
  bool isFemaleOnly;
  String date;
  String time;
  bool isCompleted;
  bool isDelete;

  factory Ride.fromJson(Map<String, dynamic> json) => Ride(
        driverId: json["driverID"],
        vehicleId: json["vehicleID"],
        startingCoordinates: json["startingCoordinates"],
        endingCoordinates: json["endingCoordinates"],
        totalFare: json["totalFare"],
        availableSeats: json["availableSeats"],
        approvedPassengers: List<ApprovedPassenger>.from(
            json["approvedPassengers"].map((x) => ApprovedPassenger.fromJson(x))),
        passengerRequests: List<PassengerRequest>.from(
            json["passengerRequests"].map((x) => PassengerRequest.fromJson(x))),
        isFemaleOnly: json["isFemaleOnly"],
        date: json["date"],
        time: json["time"],
        isCompleted: json["isCompleted"],
        isDelete: json["isDelete"],
      );

  Map<String, dynamic> toJson() => {
        "driverID": driverId,
        "vehicleID": vehicleId,
        "startingCoordinates": startingCoordinates,
        "endingCoordinates": endingCoordinates,
        "totalFare": totalFare,
        "availableSeats": availableSeats,
        "approvedPassengers": List<dynamic>.from(approvedPassengers.map((x) => x.toJson())),
        "passengerRequests": List<dynamic>.from(passengerRequests.map((x) => x.toJson())),
        "isFemaleOnly": isFemaleOnly,
        "date": date,
        "time": time,
        "isCompleted" : isCompleted,
        "isDelete": isDelete,
      };
}
