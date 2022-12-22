import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_directions_api/google_directions_api.dart';
import "package:google_maps_webservice/geocoding.dart";
import 'package:google_maps_webservice/places.dart';

class MapAutoComplete extends StatefulWidget {
  const MapAutoComplete({Key? key}) : super(key: key);

  @override
  State<MapAutoComplete> createState() => _MapAutoCompleteState();
}

class _MapAutoCompleteState extends State<MapAutoComplete> {
  void callSearch() async {
    print('starting prediction');
    final geocoding =
        GoogleMapsGeocoding(apiKey: "AIzaSyC-5vfdeyQ3AYLbu6p720MjcqL0THkLCIE");
    Prediction? prediction = await PlacesAutocomplete.show(
      offset: 0,
      radius: 1000,
      types: ['establishment'],
      strictbounds: false,
      region: "pk",
      mode: Mode.overlay, // Mode.fullscreen
      language: "en",
      components: [Component(Component.country, "pk")],
      context: context,
      apiKey: 'AIzaSyC-5vfdeyQ3AYLbu6p720MjcqL0THkLCIE',
    );
    print('${prediction?.description}  prediction');
    GeocodingResponse response =
        await geocoding.searchByPlaceId(prediction?.placeId ?? "0");
    print(response.results[0].geometry.location.lat);
    print(response.results[0].geometry.location.lng);
    print("responses yooo");

    final directionsService = DirectionsService();

    final request = DirectionsRequest(
        origin: prediction?.description.toString(),
        destination:
            "Nixor College, Khayaban-e-Shaheen, D.H.A Phase 6 Phase 6 Defence Housing Authority, Karachi");
    directionsService.route(request,
        (DirectionsResult response, DirectionsStatus? status) {
      if (status == DirectionsStatus.ok) {
        print(response.routes?[0].toString());
        print(response.routes?[0].overviewPath
            ?.map((e) =>
                jsonDecode('{"lat": ${e.latitude}, "lng": ${e.longitude} }'))
            .toList()
            .toString());
        print(response.routes?.toString());

        waypoints = response.routes?[0].overviewPath;
        print(response.geocodedWaypoints.toString());
        print(response.geocodedWaypoints?.toList().toString());
        print("waypoints");
      } else {
        // do something with error response
      }
    });
  }

  late List<GeoCoord>? waypoints;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('kinda empty rn'),
      floatingActionButton: FloatingActionButton(
        child: Text('search'),
        onPressed: () => callSearch(),
      ),
    );
  }
}
