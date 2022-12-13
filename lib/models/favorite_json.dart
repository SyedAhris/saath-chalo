class Favorite {
  Favorite({
    required this.coordinates,
    required this.name,
    required this.isDelete,
  });

  String coordinates;
  String name;
  bool isDelete;

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        coordinates: json["coordinates"],
        name: json["name"],
        isDelete: json["isDelete"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates,
        "name": name,
        "isDelete": isDelete,
      };
}
