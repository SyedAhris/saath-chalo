import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterdemo/models/coordinates.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample(
      {Key? key,
      required this.startingPosition,
      required this.endingPosition,
      this.center =
          const Coordinates(lat: "24.91792", long: "67.03194000000002"),
      required this.waypoints})
      : super(key: key);
  final Coordinates startingPosition;
  final Coordinates endingPosition;
  final Coordinates center;
  final List<Coordinates> waypoints;
  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  late final Set<Marker> markers;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    super.initState();

    markers = {
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        markerId: MarkerId('place_name'),
        position: LatLng(double.parse(widget.waypoints[0].lat),
            double.parse(widget.waypoints[0].long)),
        infoWindow: InfoWindow(
          title: 'title',
          snippet: 'address',
        ),
      ),
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        markerId: MarkerId('place_name'),
        position: LatLng(
            double.parse(widget.waypoints[widget.waypoints.length - 1].lat),
            double.parse(widget.waypoints[widget.waypoints.length - 1].long)),
        infoWindow: InfoWindow(
          title: 'title',
          snippet: 'address',
        ),
      )
    };
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        markers: markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(double.parse(widget.waypoints[0].lat),
              double.parse(widget.waypoints[0].long)),
          zoom: 11.0,
        ),
        polylines: widget.waypoints.isNotEmpty
            ? {
                Polyline(
                  polylineId: const PolylineId('1'),
                  width: 4,
                  points: widget.waypoints
                      .map((e) =>
                          LatLng(double.parse(e.lat), double.parse(e.long)))
                      .toList(),
                  color: Colors.red,
                )
              }
            : const {});
  }
}
