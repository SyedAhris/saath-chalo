import 'dart:convert';

class Coordinates {
  Coordinates({
    required this.lat,
    required this.long,
  });

  String lat;
  String long;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    lat: json["lat"],
    long: json["long"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "long": long,
  };
}