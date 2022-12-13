import 'package:flutter/material.dart';

class RideCard extends StatelessWidget {
  RideCard({
    Key? key,
    required this.journeyStart,
    required this.journeyEnd,
    required this.journeyDate,
    required this.journeyTime,
    required this.estCost,
  }) : super(key: key);

  String journeyStart;
  String journeyEnd;
  String journeyDate;
  String journeyTime;
  double estCost;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Row(
              children: [
                const Icon(Icons.pin_drop_sharp,color: Colors.green,),
                const SizedBox(width: 10,),
                Text(
                    journeyStart.length>=30? "${journeyStart.substring(0,30)}..."
                        : journeyStart
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.pin_drop_sharp,color: Colors.red,),
                const SizedBox(width: 10,),
                Text(
                    journeyEnd.length>=30? "${journeyEnd.substring(0,30)}..."
                        : journeyEnd
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children:  [
                const Icon(Icons.calendar_month),
                const Text(" "),
                Text(journeyDate.toString()),
                const SizedBox(width: 20),

                const Icon(Icons.access_time_rounded),
                const Text(" "),
                Text(journeyTime),
                const SizedBox(width: 26),

                const Text("RS ", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(estCost.toString()),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
