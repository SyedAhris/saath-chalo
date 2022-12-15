import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutterdemo/driver_pages/driver_home/driver_home.dart';
import 'package:flutterdemo/driver_pages/driver_ride_history/driver_ride_history.dart';
import 'package:flutterdemo/driver_pages/scheduled_rides/scheduled_rides.dart';
import 'package:flutterdemo/driver_pages/vehicles/vehicles_list/vehicle_list_view.dart';
import 'package:flutterdemo/global_components/side_bar.dart';
import 'package:flutterdemo/home_page/home_page.dart';
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
                  MaterialPageRoute(builder: (context) => const ScheduledRides()))),
          ListTile(
              leading: const Icon(Icons.history),
              title: const SideBarText(text: "Ride History"),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const DriverRideHistory()))),
          ListTile(
              leading: const Icon(Icons.history),
              title: const SideBarText(text: "Vehicles"),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const VehiclesListView()))),
          ListTile(
            leading: Icon(Icons.notifications),
            title: const SideBarText(text: "Notification"),
            onTap: () async {
              print('starting prediction');
              Prediction? prediction = await PlacesAutocomplete.show(
                context: context,
                apiKey: 'AIzaSyC-5vfdeyQ3AYLbu6p720MjcqL0THkLCIE',
                onError: (err) => print('$err error'),
                language: "en",
                decoration: InputDecoration(
                  hintText: 'Search',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                components: [Component(Component.country, "pk")],
              );
              print('$prediction  prediction');
            },
          ),
        ]);
  }
}
