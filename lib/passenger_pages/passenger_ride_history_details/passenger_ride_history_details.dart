import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/global_components/passenger_ride_history_details_card.dart';
import 'package:flutterdemo/global_components/passenger_side_bar.dart';

class PassengerRideHistoryDetails extends StatefulWidget {
  const PassengerRideHistoryDetails({
    Key? key
  }) : super(key: key);

  @override
  State<PassengerRideHistoryDetails> createState() => _PassengerRideHistoryDetailsState();
}

class _PassengerRideHistoryDetailsState extends State<PassengerRideHistoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const PassengerSideBar(),
        appBar: const MainAppBar(title: "Booked Rides"),
        body: Container(
            decoration: const BoxDecoration(
            image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/backimg.png'))),
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
          child: Column(
            children: [
                  PassengerRideHistoryDetailsCard(
                    name: "Syed Ahris",
                    rating: 4.5,
                    car: "Black Suzuki WagonR",
                    numberPlate: "ABC-123",
                    journeyStart: "Institute of Business Administration",
                    journeyEnd: "Askari 4",
                    acStatus: true,
                    journeyDate: "26/11/2022",
                    journeyTime: "09:15",
                    estCost: 600,
                    passengers: ["Mohammad Irtiza", "Ahris"],
                  )


            ],
          ),
        ),
            )
    );
  }
}
