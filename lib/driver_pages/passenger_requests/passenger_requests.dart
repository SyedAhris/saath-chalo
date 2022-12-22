import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/passenger_request/passenger_request.dart';
import 'package:flutterdemo/global_components/driver_side_bar.dart';
import 'package:flutterdemo/global_components/main_app_bar.dart';
import 'package:flutterdemo/global_components/map_wrapper.dart';
import 'package:flutterdemo/global_components/passenger_card.dart';
import 'package:flutterdemo/models/approved_passenger.dart';
import 'package:flutterdemo/models/passenger_request.dart';
import 'package:flutterdemo/providers_repositories/driver/passenger_requests/passenger_request_provider.dart';
import 'package:flutterdemo/providers_repositories/driver/scheduled_rides_detailed/driver_scheduled_rides_detailed_provider.dart';
import 'package:provider/provider.dart';

import '../../models/coordinates.dart';
import '../../models/rides_json.dart';
import 'passenger_demo.dart';

class PassengerRequests extends StatefulWidget {
  const PassengerRequests(
      {Key? key, required this.passengerRequests, required this.ride})
      : super(key: key);

  final Ride ride;
  final List<PassengerRequest> passengerRequests;

  @override
  State<PassengerRequests> createState() => _PassengerRequestsState();
}

class _PassengerRequestsState extends State<PassengerRequests> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PassengerRequestProvider>().fetchPassengers(widget
          .passengerRequests
          .where((e) => e.status == "Pending")
          .map((e) => e.passengerId)
          .toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    final passengers = context.watch<PassengerRequestProvider>().passengers;
    final isFetching = context.watch<PassengerRequestProvider>().isFetching;
    return Scaffold(
      drawer: const DriverSideBar(),
      appBar: const MainAppBar(title: "Scheduled Rides"),
      body: MapWrapper(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
                child: Card(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "    Passengers Requests",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      context.read<PassengerRequestProvider>().isFetching
                          ? const CircularProgressIndicator()
                          : passengers.isEmpty
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 20, bottom: 20),
                                  child: Text("No Requests"),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: widget.passengerRequests.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          (isFetching)
                                              ? const CircularProgressIndicator()
                                              : (passengers[index].id !=
                                                          widget
                                                              .passengerRequests[
                                                                  index]
                                                              .passengerId) &&
                                                      (widget
                                                              .passengerRequests[
                                                                  index]
                                                              .status !=
                                                          "Pending")
                                                  ? Container()
                                                  : PassengerCard(
                                                      status: true,
                                                      name:
                                                          "${passengers[index].firstName} ${passengers[index].lastName}",
                                                      rating: passengers[index]
                                                          .rating,
                                                      journeyStart: widget
                                                          .passengerRequests[
                                                              index]
                                                          .startingDestination,
                                                      journeyEnd: widget
                                                          .passengerRequests[
                                                              index]
                                                          .endingDestination,
                                                      onTap1: () {
                                                        // on click of deny button
                                                        widget
                                                            .passengerRequests[
                                                                index]
                                                            .status = "Denied";
                                                        //context.read<PassengerRequestProvider>().approveRequest(widget.passengerRequests[index]);
                                                        widget.ride
                                                                .passengerRequests =
                                                            widget
                                                                .passengerRequests;
                                                        context
                                                            .read<
                                                                DriverScheduledRidesDetailedProvider>()
                                                            .updateRide(
                                                                widget.ride);
                                                      },
                                                      onTap2: () {
                                                        //on click of accept button
                                                        widget.ride.approvedPassengers.add(
                                                            ApprovedPassenger(
                                                                passengerId: widget
                                                                    .passengerRequests[
                                                                        index]
                                                                    .passengerId,
                                                                startingDestination: widget
                                                                    .passengerRequests[
                                                                        index]
                                                                    .startingDestination,
                                                                endingDestination: widget
                                                                    .passengerRequests[
                                                                        index]
                                                                    .endingDestination,
                                                                startingCoordinates: widget
                                                                    .passengerRequests[
                                                                        index]
                                                                    .startingCoordinates,
                                                                endingCoordinates: widget
                                                                    .passengerRequests[
                                                                        index]
                                                                    .endingCoordinates,
                                                                waypoints: widget
                                                                    .passengerRequests[
                                                                        index]
                                                                    .waypoints,
                                                                rideFare:
                                                                    Coordinates //TODO: Ibrahim calculate correct ride fare for passengers
                                                                            .calculateFare(
                                                                                12,
                                                                                20,
                                                                                false)
                                                                        .toInt(),
                                                                driverRating: 0,
                                                                passengerRating:
                                                                    0,
                                                                isDelete:
                                                                    false));
                                                        widget.ride
                                                            .passengerRequests
                                                            .removeAt(index);
                                                        context
                                                            .read<
                                                                DriverScheduledRidesDetailedProvider>()
                                                            .updateRide(
                                                                widget.ride);
                                                      },
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .push(
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                PassengerRequestWidget(
                                                              status: false,
                                                              name:
                                                                  "${passengers[index].firstName} ${passengers[index].lastName}",
                                                              rating:
                                                                  passengers[
                                                                          index]
                                                                      .rating,
                                                              journeyStart: widget
                                                                  .passengerRequests[
                                                                      index]
                                                                  .startingDestination,
                                                              journeyEnd: widget
                                                                  .passengerRequests[
                                                                      index]
                                                                  .endingDestination,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                          Center(
                                            child: index != pass.length - 1
                                                ? const Divider(
                                                    color: Colors.black,
                                                    height: 5,
                                                    thickness: 2,
                                                    indent: 20,
                                                    endIndent: 20,
                                                  )
                                                : const Text(""),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                    ],
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Cancel Ride")),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<PassDemo> pass = [
  PassDemo(
    name: "Mohammad Irtiza",
    rating: 4.5,
    journeyStart: "Institute of Business Administration",
    journeyEnd: "Askari 4",
  ),
  PassDemo(
    name: "Syed Ahris",
    rating: 4.5,
    journeyStart: "Institute of Business Administration",
    journeyEnd: "Askari 4",
  ),
];
