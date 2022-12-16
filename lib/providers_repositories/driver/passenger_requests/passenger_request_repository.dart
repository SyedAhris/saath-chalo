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
