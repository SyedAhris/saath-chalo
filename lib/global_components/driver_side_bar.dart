import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/driver_home/driver_home.dart';
import 'package:flutterdemo/global_components/map_auto_complete.dart';
import 'package:flutterdemo/global_components/side_bar.dart';
import 'package:flutterdemo/home_page/home_page.dart';

class DriverSideBar extends StatelessWidget {
  const DriverSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideBar(
        onTapLogOut: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HomePage(title: "SaathChalo"))),
        listTiles: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const SideBarText(text: "Home"),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DriverHome())),
          ),
          ListTile(
              leading: const Icon(Icons.done_outline_sharp),
              title: const SideBarText(text: "Scheduled Rides"),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const DriverHome()))),
          ListTile(
              leading: const Icon(Icons.history),
              title: const SideBarText(text: "Ride History"),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const DriverHome()))),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const SideBarText(text: "Notification"),
            onTap: () async {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MapAutoComplete()));
              // print('starting prediction');
              // final geocoding = GoogleMapsGeocoding(
              //     apiKey: "AIzaSyC-5vfdeyQ3AYLbu6p720MjcqL0THkLCIE");
              // Prediction? prediction = await PlacesAutocomplete.show(
              //   offset: 0,
              //   radius: 1000,
              //   types: ['establishment'],
              //   strictbounds: false,
              //   region: "pk",
              //   mode: Mode.overlay, // Mode.fullscreen
              //   language: "en",
              //   components: [Component(Component.country, "pk")],
              //   context: context,
              //   apiKey: 'AIzaSyC-5vfdeyQ3AYLbu6p720MjcqL0THkLCIE',
              // );
              // print('${prediction?.description}  prediction');
              // GeocodingResponse response =
              //     await geocoding.searchByPlaceId(prediction?.placeId ?? "0");
              // print(response.results[0].geometry.location.lat);
              // print(response.results[0].geometry.location.lng);
              // print("responses yooo");
              //
              // final directionsService = DirectionsService();
              //
              // final request = DirectionsRequest(
              //
              //     // origin: 'New York',
              //     origin: prediction?.description.toString(),
              //     // origin: Map<String, dynamic>.from(
              //     //     {'place_id': prediction?.placeId}),
              //     destination:
              //         "Nixor College, Khayaban-e-Shaheen, D.H.A Phase 6 Phase 6 Defence Housing Authority, Karachi"
              //     // destination: {"lat": "24.9210938", "lng": "67.0914055"},
              //     );
              // directionsService.route(request,
              //     (DirectionsResult response, DirectionsStatus? status) {
              //   if (status == DirectionsStatus.ok) {
              //     // do something with successful response
              //     print(response.routes?[0].overviewPath.toString());
              //     final waypoints =
              //         response.routes?[0].overviewPath?.map((e) => ListTile(
              //               trailing: Text(e.latitude.toString()),
              //               leading: Text(e.longitude.toString()),
              //             ));
              //     // overviewPath
              //     //     ?.map((e) => print(e.latitude));
              //     print(response.geocodedWaypoints.toString());
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => Scaffold(
              //               body: ListView(
              //                 children:
              //                     waypoints?.toList() ?? [Text("nothing yet")],
              //               ),
              //             )));
              //   } else {
              //     // do something with error response
              //   }
              // });
            },
          ),
        ]);
  }
}
