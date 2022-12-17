import 'package:flutter/material.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_provider.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key, required this.listTiles, required this.onTapLogOut})
      : super(key: key);
  final List<ListTile> listTiles;
  final VoidCallback onTapLogOut;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: ListView(
        children: [
          SizedBox(
            height: 300,
            child: DrawerHeader(
              child: Column(children: [
                const Text(
                  'SaathChalo',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg"), //TODO: pass provider image
                  ),
                ),
                Text(
                  "${context.watch<CurrentUserProvider>().currentCustomer.firstName} ${context.watch<CurrentUserProvider>().currentCustomer.lastName}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  context.watch<CurrentUserProvider>().currentCustomer.email,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w200),
                ),
              ]),
            ),
          ),
          Column(children: listTiles.toList()),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const SideBarText(text: "Logout"),
              onTap: onTapLogOut,
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
