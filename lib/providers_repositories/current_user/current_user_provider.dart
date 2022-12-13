import 'package:flutter/material.dart';
import 'package:flutterdemo/models/user_json.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_repository.dart';

class CurrentUserProvider with ChangeNotifier {
  late User firebaseUser;
  Customer currentUser = Customer(
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
    isDelete: false,
    id: '',
  );
  String currentUserId = "";

  final CurrentUserRepository _currentUserRepository =
      FirebaseCurrentUserRepository();

  Future<String> signup(Customer customer) async {
    List res = await _currentUserRepository.signup(customer);
    String error = "";
    if (res[1] == "") {
      firebaseUser = res[0];
    } else {
      error = res[1];
    }
    notifyListeners();
    return error;
  }

  signin(String email, String password) {}
}
