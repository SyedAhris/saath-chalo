import 'package:flutter/material.dart';

import '../driver_pages/LoginPage/login_page_driver.dart';
import '../globalComponents/main_app_bar.dart';
import '../globalComponents/side_bar.dart';
import '../passenger_pages/LoginPage/login_page_passenger.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideBar(),
        appBar: const MainAppBar(title: "SaathChalo",),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Choose Login Type",
                      style: TextStyle(fontSize: 25)),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      width: 220,
                      height: 70,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginPagePassenger()));
                          },
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 25)),
                          child: const Text("Passenger")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 100),
                    child: SizedBox(
                      width: 220,
                      height: 70,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginPageDriver()));
                          },
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 25)),
                          child: const Text("Driver")),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
