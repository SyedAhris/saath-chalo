import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/driver_home/driver_home.dart';
import 'package:flutterdemo/driver_pages/driver_ride_history/driver_ride_history.dart';
import 'package:flutterdemo/driver_pages/scheduled_rides/scheduled_rides.dart';
import 'package:flutterdemo/driver_pages/vehicles/vehicles_list/vehicle_list_view.dart';
import 'package:flutterdemo/global_components/map_auto_complete.dart';
import 'package:flutterdemo/global_components/side_bar.dart';
import 'package:flutterdemo/home_page/home_page.dart';

import '../home_page/login.dart';

class DriverSideBar extends StatelessWidget {
  const DriverSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideBar(
        onTapLogOut: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Login())),
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
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ScheduledRides()))),
          ListTile(
              leading: const Icon(Icons.history),
              title: const SideBarText(text: "Ride History"),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DriverRideHistory()))),
          ListTile(
              leading: const Icon(Icons.history),
              title: const SideBarText(text: "Vehicles"),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VehiclesListView()))),
          ListTile(
            leading: Icon(Icons.notifications),
            title: const SideBarText(text: "Notification"),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MapAutoComplete())),
          ),
        ]);
  }
}
