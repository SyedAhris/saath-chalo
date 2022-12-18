import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/driver_home/driver_home.dart';
import 'package:flutterdemo/passenger_pages/passenger_home/passenger_home.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_provider.dart';
import 'package:provider/provider.dart';
import '../global_components/main_app_bar.dart';
import '../global_components/passenger_side_bar.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final isDriver=context.watch<CurrentUserProvider>().currentCustomer.isDriver;
    final isPass=context.watch<CurrentUserProvider>().currentCustomer.isPassenger;

    return Scaffold(
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
                      child: Container(
                        child: isPass==false?null: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const PassengerHome()));
                            },
                            style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 25)),
                            child: const Text("Passenger")),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 100),
                    child: SizedBox(
                      width: 220,
                      height: 70,
                      child: Container(
                        child: isDriver==false?null:ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const DriverHome()));
                            },
                            style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 25)),
                            child: const Text("Driver")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
