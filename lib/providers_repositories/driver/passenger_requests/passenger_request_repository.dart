import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/customer_json.dart';

abstract class PassengerRequestRepository {
  Future<Customer> fetchDriver(String driverId);
}

class MockPassengerRequestRepository implements PassengerRequestRepository {
  @override
  Future<Customer> fetchDriver(String driverId) async {
    return (Customer(
      id: driverId,
      firstName: driverId,
      lastName: "Arhis",
      email: "email",
      phone: "phone",
      password: "password",
      rating: 4.5,
      profilePictureLink: "profilePictureLink",
      gender: "M",
      isDriver: false,
      isPassenger: true,
      isDelete: false,
    ));
  }
}

class FirebasePassengerRequestRepository implements PassengerRequestRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Future<Customer> fetchDriver(String driverId) async {
    print("Asdasdasd");
    Customer? driver;
    await db.collection("Customers").doc(driverId).get().then((value) {
      driver = Customer.fromJson(value.data() ?? {});
    });
    return driver as Customer;
  }
}
