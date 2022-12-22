import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/booked_ride_card.dart';
import 'package:flutterdemo/global_components/map_wrapper.dart';
import 'package:flutterdemo/passenger_pages/send_request_to_driver/send_request_to_driver.dart';
import 'package:flutterdemo/providers_repositories/passenger/home/home_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../constants/convert_time.dart';
import '../../global_components/location_text_field.dart';
import '../../global_components/main_app_bar.dart';
import '../../global_components/main_button.dart';
import '../../global_components/passenger_side_bar.dart';
import '../../models/coordinates.dart';

class PassengerHome extends StatefulWidget {
  PassengerHome({Key? key}) : super(key: key);
  LatLng? startingCoords;
  LatLng? endingCoords;

  @override
  State<PassengerHome> createState() => _PassengerHomeState();
}

class _PassengerHomeState extends State<PassengerHome> {
  late TextEditingController pickUpLocationController;
  late TextEditingController dropOffLocationController;

  @override
  void initState() {
    super.initState();
    pickUpLocationController = TextEditingController()
      ..addListener(() {
        print("calling setstaate");
        print(pickUpLocationController.value.text);
        setState(() {});
      });
    dropOffLocationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PassengerSideBar(),
      appBar: const MainAppBar(title: "Home"),
      body: MapWrapper(
        markers: widget.startingCoords != null && widget.endingCoords != null
            ? {
                Marker(
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueMagenta),
                  markerId: MarkerId('starting coords'),
                  position: widget.startingCoords!,
                ),
                Marker(
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed),
                  markerId: MarkerId('ending coords'),
                  position: widget.endingCoords!,
                ),
              }
            : {},
        child: SizedBox(
          //needs to be changed so automatically fits whole screen
          height: double.infinity,
          // height: 631,
          child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  LocationTextField(
                    controller: pickUpLocationController,
                    labelText: "PickUp",
                    hintText: "e.g IBA - Karachi University",
                    onSubmitted: (text) async {
                      widget.startingCoords =
                          await MapWrapper.getLocationFromAddress(
                              pickUpLocationController.value.text);
                      setState(() {});
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: LocationTextField(
                        controller: dropOffLocationController,
                        labelText: "DropOff",
                        hintText: "e.g Chaar Meenar",
                        onSubmitted: (text) async {
                          widget.endingCoords =
                              await MapWrapper.getLocationFromAddress(
                                  dropOffLocationController.value.text);
                          setState(() {});
                        }),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: MainButton(
                            text: "Search",
                            onTap: () {
                              context
                                  .read<PassengerHomeProvider>()
                                  .getSearchedRides(
                                    Coordinates(
                                        lat: "12.345678", long: "98.765432"), //TODO : Ibrahim change to map coordinates
                                    Coordinates(
                                        lat: "21.345678", long: "87.765432"), //TODO : Ibrahim change to map coordinates
                                  );
                              final rideDetails =
                                  context.read<PassengerHomeProvider>().details;
                              showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  context: context,
                                  builder: (context) => ListView.builder(
                                      primary: false,
                                      shrinkWrap: true,
                                      itemCount: rideDetails.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                          child: Column(
                                            children: [
                                              BookedRideCard(
                                                name:
                                                    "${rideDetails[index].driver.firstName} ${rideDetails[index].driver.lastName}",
                                                car:
                                                    "${rideDetails[index].vehicle.color} ${rideDetails[index].vehicle.make} ${rideDetails[index].vehicle.model}",
                                                numberPlate: rideDetails[index]
                                                    .vehicle
                                                    .plateNumber,
                                                rating: rideDetails[index]
                                                    .driver
                                                    .rating,
                                                acStatus: rideDetails[index]
                                                    .vehicle
                                                    .ac,
                                                journeyStart: rideDetails[index]
                                                    .ride
                                                    .startingDestination,
                                                journeyEnd: rideDetails[index]
                                                    .ride
                                                    .endingDestination,
                                                journeyDate: ConvertTime
                                                    .millisecondsToDate(
                                                        rideDetails[index]
                                                            .ride
                                                            .date),
                                                journeyTime: ConvertTime
                                                    .millisecondsToTime(
                                                        rideDetails[index]
                                                            .ride
                                                            .time),
                                                estCost: rideDetails[index]
                                                    .ride
                                                    .totalFare,
                                                status: 'None',
                                                  seats:
                                                  "${rideDetails[index].ride.availableSeats}/${rideDetails[index].vehicle.seatingCapacity}",
                                              ),
                                              MainButton(
                                                  text: "Send Request",
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendRequestToDriver(
                                                          rideDetails:
                                                              rideDetails[
                                                                  index],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                              Container(
                                                  child: index !=
                                                          rideDetails.length - 1
                                                      ? const Divider(
                                                          thickness: 3,
                                                          color: Colors.black,
                                                        )
                                                      : null)
                                            ],
                                          ),
                                        );
                                      }));
                            },
                          )),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
