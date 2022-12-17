import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/providers_repositories/driver/create_ride/create_ride_repository.dart';

import '../../../models/rides_json.dart';

class CreateRideProvider with ChangeNotifier {

  CreateRideRepository _createRideRepository = FirebaseCreateRideRepository();

  void createRide(Ride ride){
    _createRideRepository.createRide(ride);
  }
}