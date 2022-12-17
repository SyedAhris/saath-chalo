import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/driver_home/choose_date_button.dart';
import 'package:flutterdemo/driver_pages/driver_home/chose_time_button.dart';
import 'package:flutterdemo/global_components/driver_side_bar.dart';
import 'package:flutterdemo/global_components/location_text_field.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/global_components/main_button.dart';
import 'package:flutterdemo/global_components/map_wrapper.dart';
import 'package:google_directions_api/google_directions_api.dart';

class DriverHome extends StatefulWidget {
  const DriverHome({Key? key}) : super(key: key);

  @override
  State<DriverHome> createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {
  late final TextEditingController pickUpLocationController;
  late final TextEditingController dropOffLocationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickUpLocationController = TextEditingController();
    dropOffLocationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: "Create Ride"),
      drawer: const DriverSideBar(),
      body: MapWrapper(
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
                  // LocationTextField(
                  //   controller: PickUpLocationController,
                  //   labelText: "PickUp",
                  //   hintText: "e.g IBA - Karachi University",
                  // ),
                  TextField(
                    controller: pickUpLocationController,
                    decoration: const InputDecoration(
                        labelText: "Pickup", hintText: "Iba"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: LocationTextField(
                        // controller: DropOffLocationController,
                        labelText: "DropOff",
                        hintText: "e.g Chaar Meenar"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [ChooseDateButton(), ChoseTimeButton()],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.directions_car_sharp),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Choose Vehicle")
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: MainButton(
                          text: "Confirm Ride",
                          onTap: () async {
                            print("starting request");
                            final request = DirectionsRequest(
                                region: "pk",
                                language: "en",
                                origin: pickUpLocationController.text,
                                destination:
                                    "Nixor College, Khayaban-e-Shaheen, D.H.A Phase 6 Phase 6 Defence Housing Authority, Karachi");
                            print("constructed request");
                            final directionsService = DirectionsService();
                            directionsService.route(request,
                                (DirectionsResult response,
                                    DirectionsStatus? status) {
                              print('aaaa');
                              print(response.routes?[0].overviewPath
                                  ?.map((e) => jsonDecode(
                                      '{"lat": ${e.latitude}, "lng": ${e.longitude} }'))
                                  .toList()
                                  .toString());
                            });
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
