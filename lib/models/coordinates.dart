import 'dart:math';

class Coordinates {
  Coordinates({
    required this.lat,
    required this.long,
  });

  String lat;
  String long;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
      };

  double getDistanceTo(Coordinates other) {
    final double earthRadius = 6371; // Earth's radius in kilometers
    final double lat1 = double.parse(lat) * pi / 180;
    final double lat2 = double.parse(other.lat) * pi / 180;
    final double lon1 = double.parse(long) * pi / 180;
    final double lon2 = double.parse(other.long) * pi / 180;
    final double deltaLat = lat2 - lat1;
    final double deltaLon = lon2 - lon1;
    final double a = sin(deltaLat / 2) * sin(deltaLat / 2) +
        cos(lat1) * cos(lat2) * sin(deltaLon / 2) * sin(deltaLon / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    final double distance = earthRadius * c;
    return distance;
  }

  static double petrolPrice = 215;

  static double calculateFare(double distance, double duration, bool isPeakHour) {
    final baseFare = 100.0; // base fare in PKR
    final distanceFare = distance * 10; // PKR 10 per km
    final durationFare = duration * 5; // PKR 5 per minute
    final petrolCost = distance * petrolPrice / 10; // cost of petrol for the distance traveled
    double peakHourSurcharge = 0;
    if (isPeakHour) {
      peakHourSurcharge = (baseFare + distanceFare + durationFare + petrolCost) * 0.20;
    }
    return baseFare + distanceFare + durationFare + petrolCost + peakHourSurcharge;
  }
}
