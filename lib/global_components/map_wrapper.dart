import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/map_sample.dart';
import 'package:flutterdemo/models/coordinates.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWrapper extends StatefulWidget {
  MapWrapper(
      {Key? key,
      this.startingCoordinate =
          const Coordinates(lat: "24.91792", long: "67.03194000000002"),
      this.endingCoordinate =
          const Coordinates(lat: "24.91792", long: "67.03194000000002"),
      required this.child,
      this.markers})
      : super(key: key);
  final Coordinates startingCoordinate;
  final Coordinates endingCoordinate;
  final Widget child;
  Set<Marker>? markers;

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
          markers: widget.markers,
          center: widget.startingCoordinate,
          startingPosition: widget.startingCoordinate,
          endingPosition: widget.endingCoordinate,
          waypoints: const [
            Coordinates(lat: "24.91792", long: "67.03194000000002"),
            Coordinates(lat: "24.9172", long: "67.03192000000001"),
            Coordinates(lat: "24.91722", long: "67.03144"),
            Coordinates(lat: "24.91704", long: "67.03143"),
            Coordinates(lat: "24.91596", long: "67.03138999999999"),
            Coordinates(lat: "24.91566", long: "67.03138000000001"),
            Coordinates(lat: "24.91429", long: "67.03133"),
          ],
        )),
        Positioned(child: widget.child)
      ],
    );
  }
}
