class Vehicle {
  Vehicle({
    this.color = "",
    this.make = "",
    this.model = "",
    this.year = "",
    this.ac = false,
    this.carType = "",
    this.seatingCapacity = -1,
    this.imageLink = "",
    this.plateNumber = "",
    this.isDelete = false,
  });

  String color;
  String make;
  String model;
  String year;
  bool ac;
  String carType;
  int seatingCapacity;
  String imageLink;
  String plateNumber;
  bool isDelete;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        color: json["color"],
        make: json["make"],
        model: json["model"],
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
        "model": model,
        "year": year,
        "ac": ac,
        "carType": carType,
        "seatingCapacity": seatingCapacity,
        "imageLink": imageLink,
        "plateNumber": plateNumber,
        "isDelete": isDelete,
      };
}
