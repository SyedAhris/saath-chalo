// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'favorite_json.dart';
import 'vehicle_json.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.rating,
    required this.profilePictureLink,
    required this.gender,
    this.licenseNumber = "",
    this.favorites = const [],
    this.vehicles = const [],
    required this.isDriver,
    required this.isPassenger,
    required this.isDelete,
  });

  String firstName;
  String lastName;
  String email;
  String phone;
  String password;
  double rating;
  String profilePictureLink;
  String gender;
  String licenseNumber;
  List<Favorite> favorites;
  List<Vehicle> vehicles;
  bool isDriver;
  bool isPassenger;
  bool isDelete;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        rating: json["rating"],
        profilePictureLink: json["profilePictureLink"],
        gender: json["gender"],
        licenseNumber: json["licenseNumber"],
        favorites: List<Favorite>.from(
            json["favorites"].map((x) => Favorite.fromJson(x))),
        vehicles: List<Vehicle>.from(
            json["vehicles"].map((x) => Vehicle.fromJson(x))),
        isDriver: json["isDriver"],
        isPassenger: json["isPassenger"],
        isDelete: json["isDelete"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "password": password,
        "rating": rating,
        "profilePictureLink": profilePictureLink,
        "gender": gender,
        "licenseNumber": licenseNumber,
        "favorites": List<dynamic>.from(favorites.map((x) => x.toJson())),
        "vehicles": List<dynamic>.from(vehicles.map((x) => x.toJson())),
        "isDriver": isDriver,
        "isPassenger" : isPassenger,
        "isDelete": isDelete,
      };
}
