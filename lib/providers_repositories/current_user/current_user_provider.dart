import 'package:flutter/material.dart';
import 'package:flutterdemo/models/customer_json.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterdemo/models/vehicle_json.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_repository.dart';

class CurrentUserProvider with ChangeNotifier {
  late User firebaseUser;
  Customer currentCustomer = Customer(
    firstName: "Syed Muhammad",
    lastName: "Ahris",
    email: "ahrissyed@gmail.com",
    phone: "03343829388",
    password: "hello1234",
    rating: 5,
    profilePictureLink: "",
    gender: "M",
    isDriver: true,
    isPassenger: false,
    isDelete: false,
    id: "oAcEIMncYEh8VtbggBAgPY8gRVg1",
  );

  final CurrentUserRepository _currentUserRepository =
      FirebaseCurrentUserRepository();

  Future<String> signup(Customer customer) async {
    List res = await _currentUserRepository.signup(customer);
    String error = "";
    if (res[1] == "") {
      firebaseUser = res[0];
      currentCustomer = res[2];
    } else {
      error = res[1];
    }
    notifyListeners();
    return error;
  }

  signin(String email, String password) {}

  updateCustomer() async {
    currentCustomer = await _currentUserRepository.updateCustomer(currentCustomer.id);
    notifyListeners();
  }

  changePassword(String emailId) {
    _currentUserRepository.sendPasswordChangeReq(emailId);
  }
}
