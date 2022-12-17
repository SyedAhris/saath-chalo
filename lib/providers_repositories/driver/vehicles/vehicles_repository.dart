import 'package:flutterdemo/models/vehicle_json.dart';

import '../../../models/customer_json.dart';

abstract class VehiclesRepository {
  Future<List<Vehicle>> fetchUsersList();
  void addVehicle(Vehicle vehicle, Customer currentCustomer);
}

class FirebaseVehiclesRepository implements VehiclesRepository {
  @override
  Future<List<Vehicle>> fetchUsersList() {
    // TODO: implement fetchUsersList after connecting firebase
    throw UnimplementedError();
  }

  @override
  void addVehicle(Vehicle vehicle, Customer currentCustomer) {
    // TODO: implement addVehicle
  }
}

class MockVehiclesRepository implements VehiclesRepository {
  @override
  Future<List<Vehicle>> fetchUsersList() async {
    List<Vehicle> vehicles = [
      Vehicle(
        make: "Suzuki",
        model: "WagonR",
        year: "2019",
        plateNumber: "ABC-123",
        seatingCapacity: 4,
        ac: true,
        color: 'Black',
        carType: 'hatchback',
        imageLink: '',
        isDelete: false,
      ),
      Vehicle(
        make: "Suzuki",
        model: "Cultus",
        year: "2019",
        plateNumber: "BCD-123",
        seatingCapacity: 4,
        ac: true,
        color: 'Yellow',
        carType: 'hatchback',
        imageLink: '',
        isDelete: false,
      ),
    ];
    return vehicles;
  }

  @override
  void addVehicle(Vehicle vehicle, Customer currentCustomer) {
    // TODO: implement addVehicle
    print(vehicle.model);
  }
}
