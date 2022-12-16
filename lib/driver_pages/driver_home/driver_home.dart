import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/driver_home/choose_date_button.dart';
import 'package:flutterdemo/driver_pages/driver_home/chose_time_button.dart';
import 'package:flutterdemo/global_components/driver_side_bar.dart';
import 'package:flutterdemo/global_components/location_text_field.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/global_components/main_button.dart';

class DriverHome extends StatelessWidget {
  const DriverHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: "Create Ride"),
      drawer: const DriverSideBar(),
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
              padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const LocationTextField(
                    labelText: "PickUp",
                    hintText: "e.g IBA - Karachi University",
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: LocationTextField(
                        labelText: "DropOff", hintText: "e.g Chaar Meenar"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ChooseDateButton(),
                        ChoseTimeButton()
                      ],
                    ),
                  ),
                  //  Padding(
                  //   padding: const EdgeInsets.only(top: 10),
                  //   child: RecurringRideWidget(
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(

                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black
                        ),
                          onPressed: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.directions_car_sharp),
                              SizedBox(width: 5,),
                              Text("Choose Vehicle")
                            ],
                          )
                      ),
                    ),
                  ),

                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: MainButton(
                          text: "Confirm Ride",
                          onTap: () {},
                        )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
