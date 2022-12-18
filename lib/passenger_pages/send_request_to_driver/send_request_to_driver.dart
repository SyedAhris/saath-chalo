import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/map_wrapper.dart';

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
        appBar: const MainAppBar(title: "Request Driver"),
        body: MapWrapper(
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
                                onTap: () {},
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
