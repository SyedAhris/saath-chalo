import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/ride_list_tile.dart';

import '../../global_components/location_text_field.dart';
import '../../global_components/main_app_bar.dart';
import '../../global_components/main_button.dart';
import '../../global_components/passenger_side_bar.dart';

class PassengerHome extends StatelessWidget {
  const PassengerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PassengerSideBar(),
      appBar: const MainAppBar(title: "Home"),
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const LocationTextField(
                    labelText: "PickUp",
                    hintText: "e.g IBA - Karachi University",
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: LocationTextField(
                        labelText: "DropOff", hintText: "e.g Chaar Meenar"),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: MainButton(
                          text: "Search",
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => Wrap(
                                      children: [1, 2, 3]
                                          .map((e) => RideListTile())
                                          .toList(),
                                    ));
                          },
                        )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
