// To parse this JSON data, do
//
//     final vehiclesJson = vehiclesJsonFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class VehiclesJson {
  VehiclesJson({
    required this.make,
    required this.model,
    required this.year,
    required this.plateNumber,
    required this.color,
    required this.numberOfPassengers,
    required this.isAc,
  });

  final String make;
  final String model;
  final String year;
  final String plateNumber;
  final String color;
  final int numberOfPassengers;
  final bool isAc;

  factory VehiclesJson.fromJson(String str) => VehiclesJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VehiclesJson.fromMap(Map<String, dynamic> json) => VehiclesJson(
    make: json["make"],
    model: json["model"],
    year: json["year"],
    plateNumber: json["plateNumber"],
    color: json["color"],
    numberOfPassengers: json["numberOfPassengers"],
    isAc: json["isAC"],
  );

  Map<String, dynamic> toMap() => {
    "make": make,
    "model": model,
    "year": year,
    "plateNumber": plateNumber,
    "color": color,
    "numberOfPassengers": numberOfPassengers,
    "isAC": isAc,
  };
}
