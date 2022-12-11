class Vehicle {
  Vehicle({
    required this.color,
    required this.make,
    required this.year,
    required this.ac,
    required this.carType,
    required this.seatingCapacity,
    required this.imageLink,
    required this.plateNumber,
    required this.isDelete,
  });

  String color;
  String make;
  String year;
  bool ac;
  String carType;
  int seatingCapacity;
  String imageLink;
  String plateNumber;
  String isDelete;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        color: json["color"],
        make: json["make"],
        year: json["year"],
        ac: json["ac"],
        carType: json["carType"],
        seatingCapacity: json["seatingCapacity"],
        imageLink: json["imageLink"],
        plateNumber: json["plateNumber"],
        isDelete: json["isDelete"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "make": make,
        "year": year,
        "ac": ac,
        "carType": carType,
        "seatingCapacity": seatingCapacity,
        "imageLink": imageLink,
        "plateNumber": plateNumber,
        "isDelete": isDelete,
      };
}
