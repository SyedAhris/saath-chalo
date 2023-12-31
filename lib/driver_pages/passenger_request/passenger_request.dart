import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/driver_side_bar.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/global_components/map_wrapper.dart';
import 'package:flutterdemo/global_components/passenger_card.dart';

class PassengerRequestWidget extends StatefulWidget {
  const PassengerRequestWidget({
    Key? key,
    required this.status,
    required this.name,
    required this.journeyStart,
    required this.journeyEnd,
    required this.rating,
  }) : super(key: key);

  final bool status;
  final String name;
  final String journeyStart;
  final String journeyEnd;
  final double rating;
  @override
  State<PassengerRequestWidget> createState() => _PassengerRequestWidgetState();
}

class _PassengerRequestWidgetState extends State<PassengerRequestWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DriverSideBar(),
      appBar: const MainAppBar(title: "Scheduled Rides"),
      body: MapWrapper(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
              child: Card(
                child: PassengerCard(
                    status: widget.status,
                    name: widget.name,
                    journeyStart: widget.journeyStart,
                    journeyEnd: widget.journeyEnd,
                    rating: widget.rating,
                    onTap: () {},
                    onTap1: () {},
                    onTap2: () {}),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: const Text("Deny")),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () {},
                            child: const Text("Approve")),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
