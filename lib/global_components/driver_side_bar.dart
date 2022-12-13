import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutterdemo/driver_pages/driver_home/driver_home.dart';
import 'package:flutterdemo/global_components/side_bar.dart';
import 'package:flutterdemo/home_page/home_page.dart';
import "package:google_maps_webservice/geocoding.dart";
import 'package:google_maps_webservice/places.dart';

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
              print('starting prediction');
              final geocoding = GoogleMapsGeocoding(
                  apiKey: "AIzaSyC-5vfdeyQ3AYLbu6p720MjcqL0THkLCIE");
              Prediction? prediction = await PlacesAutocomplete.show(
                offset: 0,
                radius: 1000,
                types: ['establishment'],
                strictbounds: false,
                region: "pk",
                mode: Mode.fullscreen, // Mode.fullscreen
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
            },
          ),
        ]);
  }
}
