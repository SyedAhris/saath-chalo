class ApprovedPassenger {
  ApprovedPassenger({
    required this.passengerId,
    required this.startingCoordinates,
    required this.endingCoordinates,
    required this.rideFare,
    required this.driverRating,
    required this.passengerRating,
    required this.isDelete,
  });

  String passengerId;
  String startingCoordinates;
  String endingCoordinates;
  int rideFare;
  int driverRating;
  int passengerRating;
  bool isDelete;

  factory ApprovedPassenger.fromJson(Map<String, dynamic> json) =>
      ApprovedPassenger(
        passengerId: json["passengerID"],
        startingCoordinates: json["startingCoordinates"],
        endingCoordinates: json["endingCoordinates"],
        rideFare: json["rideFare"],
        driverRating: json["driverRating"],
        passengerRating: json["passengerRating"],
        isDelete: json["isDelete"],
      );

  Map<String, dynamic> toJson() => {
        "passengerID": passengerId,
        "startingCoordinates": startingCoordinates,
        "endingCoordinates": endingCoordinates,
        "rideFare": rideFare,
        "driverRating": driverRating,
        "passengerRating": passengerRating,
        "isDelete": isDelete,
      };
}
