import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/driver_home/driver_home.dart';
import 'package:flutterdemo/globalComponents/side_bar.dart';
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
          const ListTile(
            leading: Icon(Icons.notifications),
            title: SideBarText(text: "Notification"),
          ),
        ]);
  }
}
