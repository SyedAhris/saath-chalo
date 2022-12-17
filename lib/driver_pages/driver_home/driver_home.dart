import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/driver_home/choose_date_button.dart';
import 'package:flutterdemo/driver_pages/driver_home/chose_time_button.dart';
import 'package:flutterdemo/global_components/driver_side_bar.dart';
import 'package:flutterdemo/global_components/location_text_field.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/global_components/main_button.dart';
import 'package:flutterdemo/global_components/map_wrapper.dart';
import 'package:flutterdemo/models/coordinates.dart';
import 'package:google_directions_api/google_directions_api.dart';

class DriverHome extends StatefulWidget {
  const DriverHome({Key? key}) : super(key: key);

  @override
  State<DriverHome> createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {
  late final TextEditingController pickUpLocationController;
  late final TextEditingController dropOffLocationController;
  late final DirectionsService directionsService;
  String startLoc = '';
  String endLoc = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickUpLocationController = TextEditingController();
    dropOffLocationController = TextEditingController();
    directionsService = DirectionsService();
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
                  LocationTextField(
                    labelText: "PickUp",
                    hintText: "e.g IBA - Karachi University",
                    onSubmitted: (text) async {
                      print(getRoute(
                          startingCoordinate: text,
                          endingCoordinate: "Nixor College"));
                    },
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
                          onTap: () {},
                        )),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Future<List<Coordinates>>? getRoute(
      {required String startingCoordinate,
      required String endingCoordinate}) async {
    print("starting request");
    List<Coordinates> route = [];
    final request = DirectionsRequest(
        region: "pk",
        language: "en",
        origin: startingCoordinate,
        destination: endingCoordinate);
    print("constructed request");
    await directionsService.route(request,
        (DirectionsResult response, DirectionsStatus? status) {
      print('aaaa');
      route = response.routes?[0].overviewPath
              ?.map((e) => Coordinates(
                  lat: e.latitude.toString(), long: e.longitude.toString()))
              .toList() ??
          [const Coordinates(lat: "-1", long: "-1")];
    });
    return route;
  }
}
