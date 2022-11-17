import 'package:flutter/material.dart';
import 'package:flutterdemo/globalComponents/booked_ride_card.dart';
import 'package:flutterdemo/globalComponents/main_app_bar.dart';

import '../../globalComponents/main_button.dart';
import '../passenger_home/location_text_field.dart';

class PassengerBookedRidesPending extends StatefulWidget {
  const PassengerBookedRidesPending({Key? key}) : super(key: key);

  @override
  State<PassengerBookedRidesPending> createState() => _PassengerBookedRidesPendingState();
}

class _PassengerBookedRidesPendingState extends State<PassengerBookedRidesPending> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const MainAppBar(title: "SaathChalo"),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image:  AssetImage('assets/images/backimg.png') )
        ),
        child: SizedBox(
          //needs to be changed so automatically fits whole screen
          height: double.infinity,
          // height: 631,
          child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  BookedRideCard(
                      name: "Syed Abdul Shakoor",
                      car: "Black Suzuki WagonR",
                      numberPlate: "ABC-123",
                      journeyStart: "Institute of Business Administration",
                      journeyEnd: "Askari 4",
                      rating: 4.5,
                      acStatus: true,
                      journeyDate: "26/11/2022",
                      journeyTime: "09:15",
                      estCost: 600,
                      status: "None"
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: LocationTextField(
                      labelText: "PickUp",
                      hintText: "e.g IBA - Karachi University",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: LocationTextField(
                        labelText: "DropOff", hintText: "e.g Chaar Meenar"),
                  ),
                  const Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: MainButton(text: "Search")),
                  )
                ],
              )),
        ),
      )
    );
  }
}
