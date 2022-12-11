class PassengerRequest {
  PassengerRequest({
    required this.passengerId,
    required this.startingCoordinates,
    required this.endingCoordinates,
    required this.status,
    required this.isDelete,
  });

  String passengerId;
  String startingCoordinates;
  String endingCoordinates;
  String status;
  bool isDelete;

  factory PassengerRequest.fromJson(Map<String, dynamic> json) =>
      PassengerRequest(
        passengerId: json["passengerID"],
        startingCoordinates: json["startingCoordinates"],
        endingCoordinates: json["endingCoordinates"],
        status: json["status"],
        isDelete: json["isDelete"],
      );

  Map<String, dynamic> toJson() => {
        "passengerID": passengerId,
        "startingCoordinates": startingCoordinates,
        "endingCoordinates": endingCoordinates,
        "status" : status,
        "isDelete": isDelete,
      };
}
