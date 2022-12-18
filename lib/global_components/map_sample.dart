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
    print("making");
    Marker startPos = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      markerId: MarkerId('place_name'),
      position: LatLng(double.parse(widget.startingPosition.lat),
          double.parse(widget.startingPosition.long)),
      infoWindow: InfoWindow(
        title: 'Starting Location',
        snippet: 'address',
      ),
    );
    Marker waypointStart = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      markerId: MarkerId('place_name'),
      position: LatLng(double.parse(widget.waypoints![0].lat),
          double.parse(widget.waypoints![0].long)),
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );

    Marker waypointEnd = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      markerId: MarkerId('place_name'),
      position: LatLng(
          double.parse(widget.waypoints![widget.waypoints!.length - 1].lat),
          double.parse(widget.waypoints![widget.waypoints!.length - 1].long)),
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );
    // widget.markers?.add(startPos);
    // widget.markers?.add(waypointEnd);
    // widget.markers?.add(waypointStart);
    // widget.markers = {startPos, waypointEnd, waypointStart};
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('map sample was updated');
    print(widget.center.lat.toString());
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
                  polylineId: const PolylineId('1'),
                  width: 4,
                  points: widget.waypoints!.map((e) => e.toLatLng()).toList(),
                  color: Colors.red,
                )
              }
            : const {});
  }
}
