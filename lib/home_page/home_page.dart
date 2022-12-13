import 'package:flutter/material.dart';
import 'package:flutterdemo/passenger_pages/passenger_booked_rides/passenger_booked_rides.dart';
import 'package:flutterdemo/passenger_pages/passenger_booked_rides_status/passenger_booked_rides_accepted.dart';
import 'package:flutterdemo/passenger_pages/passenger_home/passenger_home.dart';
import '../globalComponents/main_app_bar.dart';
import '../passenger_pages/LoginPage/login_page_passenger.dart';
import 'package:flutterdemo/driver_pages/LoginPage/login_page_driver.dart';
import 'package:flutterdemo/globalComponents/passenger_side_bar.dart';

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
        drawer: SideBar(
          tapHome: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const PassengerHome())),
          tapBookedRides: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PassengerBookedRides())),
        ),
        drawer: const PassengerSideBar(),
        appBar: const MainAppBar(
          title: "SaathChalo",
        ),
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
                                builder: (context) =>
                                    const LoginPagePassenger()));
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
                                builder: (context) => const LoginPageDriver()));
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
