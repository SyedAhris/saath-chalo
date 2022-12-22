import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/customer_json.dart';

abstract class CurrentUserRepository {
  Future<List> signup(Customer customer);
  Future<List> signin(String email, String password);
  Future<Customer> updateCustomer(String customerId);
  Future<String> sendPasswordChangeReq(String emailId);
}

class FirebaseCurrentUserRepository implements CurrentUserRepository {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Future<List> signup(Customer customer) async {
    final User user;
    // print(customer.email);
    // UserCredential result = await auth.createUserWithEmailAndPassword(email: customer.email, password: customer.password);
    // user = result.user!;
    // return [user, "error"];
    print(customer.email.toString());
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: customer.email, password: customer.password);
      final User user = result.user!;
      customer.id = user.uid;
      db.collection("Customers").doc(user.uid).set(customer.toJson());
      return [user, "", customer];
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return ([
          "",
          "An account already exists with this email try logging in instead",
          ""
        ]);
      } else if (e.code == 'invalid-email') {
        return (["", "Invalid Email", ""]);
      } else {
        return (["", e.code, ""]);
      }
    }
  }

  @override
  Future<List> signin(String email, String password) async {
    try {
      Customer? customer;
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      final User user = result.user!;
      String uid = user.uid;
      await db.collection("Customers").doc(uid).get().then((value) {
        customer = Customer.fromJson(value.data() ?? {});
      });
      return [user, "", customer as Customer];
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return (["", e.code, ""]);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return (["", e.code, ""]);
      } else {
        return (["", e.code, ""]);
      }
    }
  }

  @override
  Future<Customer> updateCustomer(String customerId) async {
    Customer customer = Customer(
        id: "id",
        firstName: "firstName",
        lastName: "lastName",
        email: "email",
        phone: "phone",
        password: "password",
        rating: -1,
        profilePictureLink: "profilePictureLink",
        gender: "gender",
        isDriver: false,
        isPassenger: false,
        isDelete: false);
    print(customerId);
    await db.collection("Customers").doc(customerId).get().then((event) {
      customer = Customer.fromJson(event.data() ?? {});
    });
    print(customer.vehicles[0].make);
    return customer;
  }

  @override
  Future<String> sendPasswordChangeReq(String emailId) async {
    try {
      print(emailId);
      await auth.sendPasswordResetEmail(email: emailId);
      print("hello1");
      return "";
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("user not found");
        return "User does not exist with the following email";
      } else {
        return "";
      }
    }
  }
}
