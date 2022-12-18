import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterdemo/models/coordinates.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  MapSample(
      {Key? key,
      required this.startingPosition,
      required this.endingPosition,
      this.center =
          const Coordinates(lat: "24.91792", long: "67.03194000000002"),
      this.waypoints,
      this.markers})
      : super(key: key);
  final Coordinates startingPosition;
  final Coordinates endingPosition;
  Coordinates center;
  final List<Coordinates>? waypoints;
  Set<Marker>? markers;

  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  // late final Set<Marker> markers;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    super.initState();
    if (widget.waypoints != null && widget.waypoints!.length > 0) {
      widget.markers = widget.markers ?? {};
      print("workingg");
      Marker waypointStart = Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        markerId: MarkerId('start'),
        position: LatLng(double.parse(widget.waypoints![0].lat),
            double.parse(widget.waypoints![0].long)),
      );

      Marker waypointEnd = Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        markerId: MarkerId('end'),
        position: LatLng(
            double.parse(widget.waypoints![widget.waypoints!.length - 1].lat),
            double.parse(widget.waypoints![widget.waypoints!.length - 1].long)),
      );

      widget.markers?.add(waypointEnd);
      widget.markers?.add(waypointStart);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        markers: widget.markers ?? {},
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: widget.center.toLatLng(),
          zoom: 11.0,
        ),
        polylines: widget.waypoints != null
            ? {
                Polyline(
                  jointType: JointType.round,
                  polylineId: const PolylineId('1'),
                  width: 4,
                  points: widget.waypoints!.map((e) => e.toLatLng()).toList(),
                  color: Colors.orange,
                )
              }
            : const {});
  }
}
