import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/passenger_side_bar.dart';
import 'package:flutterdemo/models/coordinates.dart';
import 'package:flutterdemo/models/passenger_request.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/convert_time.dart';
import '../../global_components/booked_ride_card.dart';
import '../../global_components/location_text_field.dart';
import '../../global_components/main_app_bar.dart';
import '../../global_components/main_button.dart';
import '../../providers_repositories/passenger/home/home_provider.dart';

class SendRequestToDriver extends StatefulWidget {
  const SendRequestToDriver({Key? key, required this.rideDetails})
      : super(key: key);

  final PassengerHomeListDetails rideDetails;
  @override
  State<SendRequestToDriver> createState() => _SendRequestToDriverState();
}

class _SendRequestToDriverState extends State<SendRequestToDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        drawer: const PassengerSideBar(),
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
                            children: [
                              MainButton(
                                text: "Confirm",
                                width: 300,
                                onTap: () {
                                  List<Coordinates> sampleCoordinates = [
                                    Coordinates(
                                        lat: "24.91704", long: "67.03143"),
                                    Coordinates(
                                        lat: "24.91596",
                                        long: "67.03138999999999"),
                                    Coordinates(
                                        lat: "24.91566",
                                        long: "67.03138000000001"),
                                    Coordinates(
                                        lat: "24.91429", long: "67.03133"),
                                    Coordinates(
                                        lat: "24.91377",
                                        long: "67.03131000000002"),
                                    Coordinates(
                                        lat: "24.91372",
                                        long: "67.03136999999998"),
                                    Coordinates(
                                        lat: "24.91366", long: "67.03141"),
                                    Coordinates(
                                        lat: "24.91356", long: "67.03144"),
                                    Coordinates(
                                        lat: "24.91306", long: "67.03141"),
                                    Coordinates(
                                        lat: "24.91142", long: "67.03134"),
                                    Coordinates(
                                        lat: "24.91091", long: "67.03161"),
                                    Coordinates(
                                        lat: "24.91084",
                                        long: "67.03165999999999"),
                                    Coordinates(
                                        lat: "24.91078", long: "67.03172"),
                                    Coordinates(
                                        lat: "24.91075",
                                        long: "67.03228000000001"),
                                    Coordinates(
                                        lat: "24.91065",
                                        long: "67.03291999999999"),
                                    Coordinates(
                                        lat: "24.91058", long: "67.03401"),
                                    Coordinates(
                                        lat: "24.91054",
                                        long: "67.03451000000001"),
                                    Coordinates(
                                        lat: "24.91062",
                                        long: "67.03462999999999"),
                                    Coordinates(
                                        lat: "24.9106",
                                        long: "67.03487999999999"),
                                    Coordinates(
                                        lat: "24.91053", long: "67.03548"),
                                    Coordinates(
                                        lat: "24.91046",
                                        long: "67.03629000000001"),
                                    Coordinates(
                                        lat: "24.91035", long: "67.03626"),
                                    Coordinates(
                                        lat: "24.91022", long: "67.03718"),
                                    Coordinates(
                                        lat: "24.91017",
                                        long: "67.03816999999998"),
                                  ];
                                  String passengerId = context
                                      .read<CurrentUserProvider>()
                                      .currentCustomer
                                      .id;
                                  PassengerRequest pr = PassengerRequest(
                                      passengerId: passengerId,
                                      startingDestination:
                                          "startingDestination", //TODO : Ibrahim change this
                                      endingDestination: "endingDestination", //TODO : Ibrahim change this
                                      startingCoordinates: Coordinates(
                                          lat: "24.91704", long: "67.03143"), //TODO : Ibrahim change this
                                      endingCoordinates: Coordinates(
                                          lat: "24.91017",
                                          long: "67.03816999999998"),//TODO : Ibrahim change this
                                      waypoints: sampleCoordinates, //TODO : Ibrahim change this
                                      status: "Pending",
                                      isDelete: false);
                                  context
                                      .read<PassengerHomeProvider>()
                                      .sendRequest(pr, widget.rideDetails.ride);
                                },
                              )
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
