import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/convert_time.dart';
import 'package:flutterdemo/global_components/map_wrapper.dart';
import 'package:provider/provider.dart';

import '../../global_components/booked_ride_card.dart';
import '../../global_components/location_text_field.dart';
import '../../global_components/main_app_bar.dart';
import '../../global_components/main_button.dart';
import '../../providers_repositories/passenger/booked_rides_details/booked_rides_details_provider.dart';

class PassengerBookedRidesAccepted extends StatefulWidget {
  const PassengerBookedRidesAccepted(
      {Key? key, required this.rideId, required this.status})
      : super(key: key);

  final String rideId;
  final String status;

  @override
  State<PassengerBookedRidesAccepted> createState() =>
      _PassengerBookedRidesAcceptedState();
}

class _PassengerBookedRidesAcceptedState
    extends State<PassengerBookedRidesAccepted> {
  late TextEditingController pickUpLocationController;
  late TextEditingController dropOffLocationController;

  @override
  void initState() {
    super.initState();
    context.read<BookedRidesDetailProvider>().fetchRide(widget.rideId);
    pickUpLocationController = TextEditingController();
    dropOffLocationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final ride = context.watch<BookedRidesDetailProvider>().ride;
    final driver = context.watch<BookedRidesDetailProvider>().driver;
    final vehicle = context.watch<BookedRidesDetailProvider>().vehicle;

    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const MainAppBar(title: "Accepted Rides"),
        body: MapWrapper(
          child: SizedBox(
            //needs to be changed so automatically fits whole screen
            height: double.infinity,
            // height: 631,
            child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 40, right: 40),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      BookedRideCard(
                        name: "${driver.firstName} ${driver.lastName}",
                        car:
                            "${vehicle.color} ${vehicle.make} ${vehicle.model}",
                        numberPlate: vehicle.plateNumber,
                        journeyStart: ride.startingDestination,
                        journeyEnd: ride.endingDestination,
                        rating: driver.rating,
                        acStatus: vehicle.ac,
                        journeyDate: ConvertTime.millisecondsToDate(ride.date),
                        journeyTime: ConvertTime.millisecondsToTime(ride.time),
                        estCost: ride.totalFare,
                        status: widget.status,
                        seats:
                            "${ride.availableSeats}/${vehicle.seatingCapacity}",
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: LocationTextField(
                          controller: pickUpLocationController,
                          labelText: "PickUp",
                          hintText: "e.g IBA - Karachi University",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: LocationTextField(
                            controller: dropOffLocationController,
                            labelText: "DropOff",
                            hintText: "e.g Chaar Meenar"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Choose pickup and dropoff points on the "),
                          Text("selected route")
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 200, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MainButton(
                              text: "Update Request",
                              width: 200,
                              onTap: () {},
                            ),
                            SizedBox(
                              width: 75,
                              height: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  onPressed: () {},
                                  child: const Icon(
                                      Icons.restore_from_trash_sharp)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ));
  }
}
