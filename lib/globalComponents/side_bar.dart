import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key, required this.tapHome, required this.tapBookedRides})
      : super(key: key);
  final VoidCallback tapHome;
  final VoidCallback tapBookedRides;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: ListView(
        children: [
          SizedBox(
            height: 300,
            child: DrawerHeader(
              child: Column(children: const [
                Text(
                  'SaathChalo',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg"),
                  ),
                ),
                Text(
                  'Syed Muhammad Ahris',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'ahrissyed@gmail.com',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w200),
                ),
              ]),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: SideBarText(text: "Home"),
            onTap: tapHome,
          ),
          ListTile(
            leading: Icon(Icons.done_outline_sharp),
            title: SideBarText(text: "Booked Rides"),
            onTap: tapBookedRides,
          ),
          const ListTile(
            leading: Icon(Icons.history),
            title: SideBarText(text: "Ride History"),
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: SideBarText(text: "Notification"),
          ),
          const Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: SideBarText(text: "Logout"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SideBarText extends StatelessWidget {
  const SideBarText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 18),
    );
  }
}
