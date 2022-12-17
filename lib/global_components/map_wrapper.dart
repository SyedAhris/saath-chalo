import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/map_sample.dart';
import 'package:flutterdemo/models/coordinates.dart';

class MapWrapper extends StatelessWidget {
  const MapWrapper({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
            child: MapSample(
          startingPosition:
              Coordinates(lat: "24.91792", long: "67.03194000000002"),
          endingPosition:
              Coordinates(lat: "24.91792", long: "67.03194000000002"),
          waypoints: [
            Coordinates(lat: "24.91792", long: "67.03194000000002"),
            Coordinates(lat: "24.9172", long: "67.03192000000001"),
            Coordinates(lat: "24.91722", long: "67.03144"),
            Coordinates(lat: "24.91704", long: "67.03143"),
            Coordinates(lat: "24.91596", long: "67.03138999999999"),
            Coordinates(lat: "24.91566", long: "67.03138000000001"),
            Coordinates(lat: "24.91429", long: "67.03133"),
          ],
        )),
        Positioned(child: child)
      ],
    );
  }
}
