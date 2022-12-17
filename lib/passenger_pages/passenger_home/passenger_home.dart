import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/booked_ride_card.dart';
import 'package:flutterdemo/global_components/map_wrapper.dart';
import 'package:flutterdemo/passenger_pages/send_request_to_driver/send_request_to_driver.dart';
import 'package:flutterdemo/providers_repositories/passenger/home/home_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/convert_time.dart';
import '../../global_components/location_text_field.dart';
import '../../global_components/main_app_bar.dart';
import '../../global_components/main_button.dart';
import '../../global_components/passenger_side_bar.dart';
import '../../models/coordinates.dart';

class PassengerHome extends StatefulWidget {
  const PassengerHome({Key? key}) : super(key: key);

  @override
  State<PassengerHome> createState() => _PassengerHomeState();
}

class _PassengerHomeState extends State<PassengerHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PassengerSideBar(),
      appBar: const MainAppBar(title: "Home"),
      body: MapWrapper(
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
                                        lat: "12.345678", long: "98.765432"),
                                    Coordinates(
                                        lat: "21.345678", long: "87.765432"),
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
