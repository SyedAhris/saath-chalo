import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutterdemo/constants/constants.dart';
import 'package:flutterdemo/global_components/driver_side_bar.dart';
import 'package:flutterdemo/global_components/location_text_field.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/global_components/main_button.dart';
import 'package:flutterdemo/global_components/map_wrapper.dart';
import 'package:flutterdemo/models/coordinates.dart';
import 'package:flutterdemo/models/rides_json.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_provider.dart';
import 'package:flutterdemo/providers_repositories/driver/create_ride/create_ride_provider.dart';
import 'package:google_directions_api/google_directions_api.dart';
import 'package:provider/provider.dart';

import '../../models/vehicle_json.dart' as vehicle_model;
import '../vehicles/vehicles_list/vehicles_list_tile.dart';

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
  List<Coordinates> waypoints = [];

  bool isVehicle = false;

  //added prefix vehicle_model as its conflicting with Vehicle class in Google maps
  vehicle_model.Vehicle chosenVehicle = vehicle_model.Vehicle(
      color: "",
      make: "",
      model: "",
      year: "",
      ac: false,
      carType: "",
      seatingCapacity: -1,
      imageLink: "",
      plateNumber: "",
      isDelete: false);

  late int dateDay;
  late int dateMonth;
  late int dateYear;
  late DateTime dateChosen;
  bool dateSelected = false;

  late int timeHour;
  late int timeMinute;
  late DateTime timeChosen;
  bool timeSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context
        .read<CurrentUserProvider>()
        .updateCustomer(); // TODO: remove this after signin flow is created
    pickUpLocationController = TextEditingController();
    dropOffLocationController = TextEditingController();
    directionsService = DirectionsService();
  }

  @override
  Widget build(BuildContext context) {
    final vehicles =
        context.watch<CurrentUserProvider>().currentCustomer.vehicles;
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
                    controller: pickUpLocationController,
                    labelText: "PickUp",
                    hintText: "e.g IBA - Karachi University",
                    onSubmitted: (text) async {
                      waypoints = await getRoute(
                              startingCoordinate: text,
                              endingCoordinate: "Nixor College") ??
                          [];
                      print('${waypoints.length} waypoints length');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: LocationTextField(
                        controller: dropOffLocationController,
                        labelText: "DropOff",
                        hintText: "e.g Chaar Meenar"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: dateSelected == false
                              ? TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white)
                              : TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: MainColors.primary),
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(DateTime.now().year,
                                    DateTime.now().month, DateTime.now().day),
                                maxTime:
                                    DateTime(DateTime.now().year + 5, 12, 31),
                                onChanged: (date) {}, onConfirm: (date) {
                              dateDay = date.day;
                              dateMonth = date.month;
                              dateYear = date.year;
                              dateSelected = true;
                              dateChosen = date;
                              setState(() {});
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_today_outlined,
                                size: 20,
                              ),
                              Container(
                                child: dateSelected == false
                                    ? const Text("Choose Date")
                                    : Text(" $dateDay/$dateMonth/$dateYear"),
                              )
                            ],
                          ),
                        ),
                        TextButton(
                          style: timeSelected == false
                              ? TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white)
                              : TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: MainColors.primary),
                          onPressed: () {
                            DatePicker.showTime12hPicker(context,
                                showTitleActions: true,
                                onChanged: (date) {}, onConfirm: (date) {
                              timeHour = date.hour;
                              timeMinute = date.minute;
                              timeSelected = true;
                              timeChosen =
                                  DateTime(0, 0, 0, date.hour, date.minute);
                              setState(() {});
                            }, currentTime: DateTime.now());
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.access_time_outlined,
                                size: 20,
                              ),
                              Container(
                                child: timeSelected == false
                                    ? const Text("Choose Time")
                                    : Text(" $timeHour:$timeMinute"),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                          style: (isVehicle)
                              ? ElevatedButton.styleFrom(
                                  backgroundColor: MainColors.primary,
                                  foregroundColor: Colors.black,
                                )
                              : ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.30,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25.0),
                                      topRight: Radius.circular(25.0),
                                    ),
                                  ),
                                  child: ListView.builder(
                                      itemCount: vehicles.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            chosenVehicle = vehicles[index];
                                            print(chosenVehicle.make);
                                            setState(() {
                                              isVehicle = true;
                                            });
                                          },
                                          child: VehiclesListTile(
                                            vehicles: vehicles[index],
                                          ),
                                        );
                                      }),
                                );
                              },
                            );
                          },
                          child: (isVehicle)
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "${chosenVehicle.make} ${chosenVehicle.model}"),
                                    Text(chosenVehicle.plateNumber),
                                  ],
                                )
                              : Row(
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
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: MainButton(
                            text: "Confirm Ride",
                            onTap: () async {
                              waypoints = await getRoute(
                                      startingCoordinate:
                                          pickUpLocationController.value.text,
                                      endingCoordinate:
                                          dropOffLocationController
                                              .value.text) ??
                                  [];
                              print('${waypoints.length} waypoints length');
                              if (!dateSelected) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Please Select Date"),
                                  ),
                                );
                              } else if (!timeSelected) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Please Select Time"),
                                  ),
                                );
                              } else if (!isVehicle) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Please Select a Vehicle"),
                                  ),
                                );
                              } else {
                                String driverId = context
                                    .read<CurrentUserProvider>()
                                    .currentCustomer
                                    .id;

                                Ride ride = Ride(
                                  id: "${DateTime.now().microsecondsSinceEpoch}$driverId",
                                  driverId: driverId,
                                  vehicleId: chosenVehicle.plateNumber,
                                  startingDestination:
                                      pickUpLocationController.value.text,
                                  endingDestination:
                                      dropOffLocationController.value.text,
                                  startingCoordinates: waypoints[0],
                                  endingCoordinates:
                                      waypoints[waypoints.length - 1],
                                  waypoints: waypoints,
                                  totalFare: 1000,
                                  availableSeats:
                                      chosenVehicle.seatingCapacity - 1,
                                  isFemaleOnly: false,
                                  date: dateChosen.millisecondsSinceEpoch,
                                  time: DateTime(0, 0, 0, timeChosen.hour,
                                          timeChosen.minute)
                                      .millisecondsSinceEpoch,
                                  isCompleted: false,
                                  isRecurring: false,
                                  isDelete: false,
                                );
                                //print(DateTime(0,0,0,17,30).toString());
                                context
                                    .read<CreateRideProvider>()
                                    .createRide(ride);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Ride is created."),
                                  ),
                                );
                                //print(dateChosen.toString());
                                //print(timeChosen.toString());
                                //print(chosenVehicle.make);
                              }
                            },
                          ),
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
    await directionsService.route(request,
        (DirectionsResult response, DirectionsStatus? status) {
      route = response.routes?[0].overviewPath
              ?.map((e) => Coordinates(
                  lat: e.latitude.toString(), long: e.longitude.toString()))
              .toList() ??
          [const Coordinates(lat: "-1", long: "-1")];
    });
    return route;
  }
}
