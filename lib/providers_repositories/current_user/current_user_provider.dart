import 'package:flutter/material.dart';
import 'package:flutterdemo/models/user_json.dart';

class CurrentUserProvider with ChangeNotifier {
  User currentUser = User(
      firstName: "Syed Muhammad",
      lastName: "Ahris",
      email: "ahrissyed@gmail.com",
      phone: "03343829388",
      password: "hello1234",
      rating: 5,
      profilePictureLink: "",
      gender: "m",
      isDriver: false,
      isPassenger: true,
      isDelete: false);
}
