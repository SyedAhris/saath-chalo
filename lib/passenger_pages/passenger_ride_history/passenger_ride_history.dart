import 'package:flutter/material.dart';

import '../../global_components/main_app_bar.dart';
import '../../global_components/ride_list_tile.dart';

class PassengerRideHistory extends StatelessWidget {
  const PassengerRideHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: "Ride History"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: const <Widget>[
                  Text(
                    "Approved",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  Icon(
                    Icons.check_circle_outline_outlined,
                    size: 28,
                    color: Colors.green,
                  ),
                ],
              ),
              const RideListTile(),
              Row(
                children: const <Widget>[
                  Text(
                    "Pending",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  Icon(
                    Icons.access_time_outlined,
                    size: 28,
                    color: Colors.grey,
                  ),
                ],
              ),
              const RideListTile(),
              Row(
                children: const <Widget>[
                  Text(
                    "Rejected",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  Icon(
                    Icons.cancel_outlined,
                    size: 28,
                    color: Colors.red,
                  ),
                ],
              ),
              const RideListTile(),
            ],
          ),
        ),
      ),
    );
  }
}
