import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/providers_repositories/driver/passenger_requests/passenger_request_repository.dart';

import '../../../models/customer_json.dart';

class PassengerRequestProvider with ChangeNotifier{
  List<Customer> passenger = [];

  PassengerRequestRepository _passengerRequestRepository = MockPassengerRequestRepository();

  fetchPassengers(List<String> passengers)async {
    List<Customer> passengerCopy = [];
    for (int i = 0; i<passengers.length;i++) {
      passengerCopy.add(await _passengerRequestRepository.fetchDriver(passengers[i]));
    }
    passenger = passengerCopy;
  }
}