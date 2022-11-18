import 'package:flutter/material.dart';
import 'package:flutterdemo/globalComponents/booked_ride_card.dart';
import 'package:flutterdemo/globalComponents/main_app_bar.dart';

import '../../globalComponents/location_text_field.dart';
import '../../globalComponents/main_button.dart';

class SendRequestToDriver extends StatefulWidget {
  const SendRequestToDriver({Key? key}) : super(key: key);

  @override
  State<SendRequestToDriver> createState() => _SendRequestToDriverState();
}

class _SendRequestToDriverState extends State<SendRequestToDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const MainAppBar(title: "SaathChalo"),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/backimg.png'))),
          child: SizedBox(
            //needs to be changed so automatically fits whole screen
            height: double.infinity,
            // height: 631,
            child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
                child: SingleChildScrollView(
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
                          status: "None"),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Choose pickup and dropoff points on the "),
                          Text("selected route")
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 230, bottom: 20),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              MainButton(text: "Confirm", width: 300)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ));
  }
}
