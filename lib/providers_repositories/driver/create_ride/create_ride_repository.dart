import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/rides_json.dart';

abstract class CreateRideRepository{
  void createRide(Ride ride);
}

class FirebaseCreateRideRepository implements CreateRideRepository {

  FirebaseFirestore db = FirebaseFirestore.instance;
  
  @override
  void createRide(Ride ride) {
    db.collection("Ride").doc(ride.id).set(ride.toJson());
  }
  
}