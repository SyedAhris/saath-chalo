

import 'VehiclesJson.dart';

abstract class VehiclesRepository {
  Future<List<VehiclesJson>> fetchUsersList();
}

class FirebaseVehiclesRepository implements VehiclesRepository {
  @override
  Future<List<VehiclesJson>> fetchUsersList() {
    // TODO: implement fetchUsersList after connecting firebase
    throw UnimplementedError();
  }
}

class MockVehiclesRepository implements VehiclesRepository {
  @override
  Future<List<VehiclesJson>> fetchUsersList() async {
    // TODO: implement fetchUsersList
    List<VehiclesJson> vehicles = [
      VehiclesJson(
        make: "Suzuki",
        model: "WagonR",
        year: "2019",
        plateNumber: "ABC-123",
        numberOfPassengers: 3,
        isAc : true,
        color: 'Black',
      ),
      VehiclesJson(
        make: "Suzuki",
        model: "Cultus",
        year: "2017",
        plateNumber: "ABC-124",
        numberOfPassengers: 3,
        isAc : false,
        color: 'Blue',
      ),
      VehiclesJson(
        make: "Toyota",
        model: "Corolla",
        year: "2022",
        plateNumber: "ABC-125",
        numberOfPassengers: 3,
        isAc : true,
        color: 'White',
      ),
    ];
    return vehicles;
  }

}