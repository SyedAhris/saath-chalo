class ApprovedPassenger {
  ApprovedPassenger({
    required this.passengerId,
    required this.startingCoordinates,
    required this.endingCoordinates,
    required this.rideFare,
    required this.isDelete,
  });

  String passengerId;
  String startingCoordinates;
  String endingCoordinates;
  int rideFare;
  bool isDelete;

  factory ApprovedPassenger.fromJson(Map<String, dynamic> json) => ApprovedPassenger(
    passengerId: json["passengerID"],
    startingCoordinates: json["startingCoordinates"],
    endingCoordinates: json["endingCoordinates"],
    rideFare: json["rideFare"],
    isDelete: json["isDelete"],
  );

  Map<String, dynamic> toJson() => {
    "passengerID": passengerId,
    "startingCoordinates": startingCoordinates,
    "endingCoordinates": endingCoordinates,
    "rideFare": rideFare,
    "isDelete": isDelete,
  };
}