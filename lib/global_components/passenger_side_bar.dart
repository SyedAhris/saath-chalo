import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/side_bar.dart';
import 'package:flutterdemo/home_page/home_page.dart';
import 'package:flutterdemo/passenger_pages/passenger_booked_rides/passenger_booked_rides.dart';
import 'package:flutterdemo/passenger_pages/passenger_home/passenger_home.dart';
import 'package:flutterdemo/passenger_pages/passenger_ride_history/passenger_ride_history.dart';

class PassengerSideBar extends StatelessWidget {
  const PassengerSideBar({Key? key}) : super(key: key);

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
                MaterialPageRoute(builder: (context) => const PassengerHome())),
          ),
          ListTile(
              leading: const Icon(Icons.done_outline_sharp),
              title: const SideBarText(text: "Booked Rides"),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PassengerBookedRides()))),
          ListTile(
              leading: const Icon(Icons.history),
              title: const SideBarText(text: "Ride History"),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PassengerRideHistory()))),
          ListTile(
              leading: const Icon(Icons.notifications),
              title: const SideBarText(text: "Notification"),
              onTap: () {}),
        ]);
  }
}
