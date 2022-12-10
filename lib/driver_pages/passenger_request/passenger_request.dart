import 'package:flutter/material.dart';
import 'package:flutterdemo/globalComponents/passenger_card.dart';

import '../../globalComponents/main_app_bar.dart';
import '../../globalComponents/side_bar.dart';
import '../../passenger_pages/passenger_home/passenger_home.dart';

class PassengerRequest extends StatefulWidget {
  PassengerRequest({
    Key? key,
    required this.status,
    required this.name,
    required this.journeyStart,
    required this.journeyEnd,
    required this.rating,
  }) : super(key: key);

  bool status;
  String name;
  String journeyStart;
  String journeyEnd;
  double rating;
  @override
  State<PassengerRequest> createState() => _PassengerRequestState();
}

class _PassengerRequestState extends State<PassengerRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(
        tapHome: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const PassengerHome())),
      ),
      appBar: const MainAppBar(title: "Scheduled Rides"),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/backimg.png'))),
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
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            onPressed: () {},
                            child: Text("Deny")),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {},
                            child: Text("Approve")),
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
