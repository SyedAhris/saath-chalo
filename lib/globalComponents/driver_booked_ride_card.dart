import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DriverBookedRideCard extends StatelessWidget {
  const DriverBookedRideCard(
      {Key? key,
      required this.car,
      required this.numberPlate,
      required this.journeyStart,
      required this.journeyEnd,
      required this.acStatus,
      required this.journeyDate,
      required this.journeyTime,
      required this.estCost,
      required this.passengers})
      : super(key: key);

  final String car;
  final String numberPlate;
  final String journeyStart;
  final String journeyEnd;
  final bool acStatus;
  final String journeyDate;
  final String journeyTime;
  final int estCost;
  final List<String> passengers;
  final int count = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(car.length >= 20 ? "${car.substring(0, 20)}..." : car),
                    Text(numberPlate)
                  ],
                ),
                const SizedBox(width: 60),
                Column(
                  children: const [
                    Icon(Icons.people_outline),
                    Text("AC", style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    const Text("2/3"),
                    const SizedBox(height: 3),
                    acStatus == true
                        ? const Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 18,
                          )
                        : const Icon(Icons.circle, color: Colors.red)
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Icon(
                  Icons.pin_drop_sharp,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(journeyStart.length >= 30
                    ? "${journeyStart.substring(0, 30)}..."
                    : journeyStart),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.pin_drop_sharp,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(journeyEnd.length >= 30
                    ? "${journeyEnd.substring(0, 30)}..."
                    : journeyEnd),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Icon(Icons.calendar_month),
                const Text(" "),
                Text(journeyDate.toString()),
                const SizedBox(width: 20),
                const Icon(Icons.access_time_rounded),
                const Text(" "),
                Text(journeyTime),
                const SizedBox(width: 26),
                const Text("RS ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(estCost.toString()),
              ],
            ),
            const SizedBox(height: 15),
            const Align(
                alignment: Alignment.centerLeft, child: Text("Passengers: ")),
            ListView.builder(
              shrinkWrap: true,
              itemCount: passengers.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("${index + 1}. "),
                        Text(passengers[index].length >= 16
                            ? "${passengers[index].substring(0, 15)}..."
                            : passengers[index]),
                      ],
                    ),
                    Row(
                      children: [
                        RatingBar(
                          itemCount: 5,
                          allowHalfRating: true,
                          itemSize: 23,
                          ratingWidget: RatingWidget(
                              full: const Icon(Icons.star,
                                  color: Colors.orangeAccent),
                              half: const Icon(Icons.star_half,
                                  color: Colors.orangeAccent),
                              empty: const Icon(
                                Icons.star_border,
                                color: Colors.orangeAccent,
                              )),
                          onRatingUpdate: (double
                              value) {}, //change this when implementing ratings
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
