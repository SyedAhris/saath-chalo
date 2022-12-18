import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/map_sample.dart';
import 'package:flutterdemo/models/coordinates.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:google_maps_webservice/geocoding.dart";

class MapWrapper extends StatefulWidget {
  MapWrapper(
      {Key? key,
      this.startingCoordinate =
          const Coordinates(lat: "24.91792", long: "67.03194000000002"),
      this.endingCoordinate =
          const Coordinates(lat: "24.91792", long: "67.03194000000002"),
      required this.child,
      this.waypoints,
      this.markers})
      : super(key: key);
  final Coordinates startingCoordinate;
  final Coordinates endingCoordinate;
  final Widget child;
  final List<Coordinates>? waypoints;
  Set<Marker>? markers;

  static Future<LatLng> getLocationFromAddress(String text) async {
    final geocoding =
        GoogleMapsGeocoding(apiKey: "AIzaSyC-5vfdeyQ3AYLbu6p720MjcqL0THkLCIE");
    GeocodingResponse response = await geocoding.searchByAddress(text);
    return LatLng(response.results[0].geometry.location.lat,
        response.results[0].geometry.location.lng);
  }

  @override
  State<MapWrapper> createState() => _MapWrapperState();
}

class _MapWrapperState extends State<MapWrapper> {
  @override
  Widget build(BuildContext context) {
    print('was updated');
    print(widget.startingCoordinate.lat.toString());
    return Stack(
      children: [
        Positioned(
            child: MapSample(
          markers: widget.markers ?? {},
          center: widget.startingCoordinate,
          startingPosition: widget.startingCoordinate,
          endingPosition: widget.endingCoordinate,
          waypoints: widget.waypoints ?? [],
        )),
        Positioned(child: widget.child)
      ],
    );
  }
}
