class Coordinates {
  const Coordinates({
    required this.lat,
    required this.long,
  });

  final String lat;
  final String long;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
      };
}
