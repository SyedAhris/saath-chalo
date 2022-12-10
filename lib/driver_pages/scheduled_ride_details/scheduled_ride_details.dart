import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/passenger_requests/passenger_requests.dart';
import 'package:flutterdemo/globalComponents/driver_booked_ride_card.dart';
import 'package:flutterdemo/globalComponents/driver_side_bar.dart';
import 'package:flutterdemo/globalComponents/main_app_bar.dart';
import 'package:flutterdemo/globalComponents/main_button.dart';

class ScheduledRideDetails extends StatefulWidget {
  const ScheduledRideDetails({Key? key}) : super(key: key);

  @override
  State<ScheduledRideDetails> createState() => _ScheduledRideDetailsState();
}

class _ScheduledRideDetailsState extends State<ScheduledRideDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DriverSideBar(),
      appBar: const MainAppBar(title: "Scheduled Rides"),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/backimg.png'))),
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
          child: SafeArea(
            child: Column(
              children: [
                const DriverBookedRideCard(
                  car: "Black Suzuki WagonR",
                  numberPlate: "ABC-123",
                  journeyStart: "Institute of Business Administration",
                  journeyEnd: "Askari 4",
                  acStatus: true,
                  journeyDate: "26/11/2022",
                  journeyTime: "09:15",
                  estCost: 600,
                  passengers: ["Mohammad Irtiza", "Ahris"],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PassengerRequests()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Passenger Requests",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            )
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 310, bottom: 20),
                  child:
                      MainButton(width: 250, text: "Cancel Ride", onTap: () {}),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
