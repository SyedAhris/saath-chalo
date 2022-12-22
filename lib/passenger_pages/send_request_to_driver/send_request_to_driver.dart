import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/map_wrapper.dart';
import 'package:flutterdemo/global_components/passenger_side_bar.dart';
import 'package:flutterdemo/models/coordinates.dart';
import 'package:flutterdemo/models/passenger_request.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../constants/convert_time.dart';
import '../../global_components/booked_ride_card.dart';
import '../../global_components/location_text_field.dart';
import '../../global_components/main_app_bar.dart';
import '../../global_components/main_button.dart';
import '../../providers_repositories/passenger/home/home_provider.dart';

class SendRequestToDriver extends StatefulWidget {
  SendRequestToDriver({Key? key, required this.rideDetails}) : super(key: key);

  LatLng? startingCoords;
  LatLng? endingCoords;

  final PassengerHomeListDetails rideDetails;
  @override
  State<SendRequestToDriver> createState() => _SendRequestToDriverState();
}

class _SendRequestToDriverState extends State<SendRequestToDriver> {
  late TextEditingController pickUpLocationController;
  late TextEditingController dropOffLocationController;

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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        drawer: const PassengerSideBar(),
        appBar: const MainAppBar(title: "Request Driver"),
        body: MapWrapper(
          waypoints: widget.rideDetails.ride.waypoints,
          markers: [
            widget.startingCoords,
            widget.endingCoords,
            widget.rideDetails.ride.waypoints[0].toLatLng(),
            widget.rideDetails.ride
                .waypoints[widget.rideDetails.ride.waypoints.length - 1]
                .toLatLng()
          ].where((element) => element != null).mapIndexed((index, coordinate) {
            return Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue([
                BitmapDescriptor.hueMagenta,
                BitmapDescriptor.hueRed,
                BitmapDescriptor.hueGreen,
                BitmapDescriptor.hueOrange
              ][index]),
              markerId: MarkerId(index.toString()),
              position: coordinate!,
            );
          }).toSet(),
          child: SizedBox(
            height: double.infinity,
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, top: 40, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        BookedRideCard(
                          name:
                              "${widget.rideDetails.driver.firstName} ${widget.rideDetails.driver.lastName}",
                          car:
                              "${widget.rideDetails.vehicle.color} ${widget.rideDetails.vehicle.make} ${widget.rideDetails.vehicle.model}",
                          numberPlate: widget.rideDetails.vehicle.plateNumber,
                          rating: widget.rideDetails.driver.rating,
                          acStatus: widget.rideDetails.vehicle.ac,
                          journeyStart:
                              widget.rideDetails.ride.startingDestination,
                          journeyEnd: widget.rideDetails.ride.endingDestination,
                          journeyDate: ConvertTime.millisecondsToDate(
                              widget.rideDetails.ride.date),
                          journeyTime: ConvertTime.millisecondsToTime(
                              widget.rideDetails.ride.time),
                          estCost: widget.rideDetails.ride.totalFare,
                          status: 'None',
                          seats:
                              "${widget.rideDetails.ride.availableSeats}/${widget.rideDetails.vehicle.seatingCapacity}",
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: LocationTextField(
                              controller: pickUpLocationController,
                              labelText: "PickUp",
                              hintText: "e.g IBA - Karachi University",
                              onSubmitted: (text) async {
                                widget.startingCoords =
                                    await MapWrapper.getLocationFromAddress(
                                        pickUpLocationController.value.text);
                                setState(() {});
                              }),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Choose pickup and dropoff points on the "),
                            Text("selected route")
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MainButton(
                            text: "Confirm",
                            width: 300,
                            onTap: () {
                              if (widget.startingCoords == null ||
                                  widget.endingCoords == null) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "Please enter both pick and drop off locations")));
                                return;
                              }
                              String passengerId = context
                                  .read<CurrentUserProvider>()
                                  .currentCustomer
                                  .id;
                              PassengerRequest pr = PassengerRequest(
                                  passengerId: passengerId,
                                  startingDestination:
                                      pickUpLocationController.value.text,
                                  endingDestination:
                                      dropOffLocationController.value.text,
                                  startingCoordinates: Coordinates.fromLatlng(
                                      widget.startingCoords ?? LatLng(0, 0)),
                                  endingCoordinates: Coordinates.fromLatlng(
                                      widget.endingCoords ?? LatLng(0, 0)),
                                  waypoints: widget.rideDetails.ride
                                      .waypoints, //TODO : Ibrahim change this
                                  status: "Pending",
                                  isDelete: false);
                              context
                                  .read<PassengerHomeProvider>()
                                  .sendRequest(pr, widget.rideDetails.ride);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Request sent to driver")));
                            },
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
