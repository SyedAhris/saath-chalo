import 'package:flutter/material.dart';

class BookedRideCard extends StatelessWidget {
  BookedRideCard({
    Key? key,
    required this.name,
    required this.car,
    required this.numberPlate,
    required this.journeyStart,
    required this.journeyEnd,
    required this.rating,
    required this.acStatus,
    required this.journeyDate,
    required this.journeyTime,
    required this.estCost,
    required this.status
  }) : super(key: key);

  String name;
  String car;
  String numberPlate;
  String journeyStart;
  String journeyEnd;
  double rating;
  bool acStatus;
  String journeyDate;
  String journeyTime;
  int estCost;
  String status;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/manPic.png'),
                  radius: 25,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(name),
                    Text(car),
                    Text(numberPlate)
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  children: const [
                    Icon(Icons.star_border),
                    Icon(Icons.people_outline),
                    Text("AC",style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    Text(rating.toString()),
                    const SizedBox(height: 3),
                    const Text("2/3"),
                    const SizedBox(height: 3),
                    acStatus==true? const Icon(Icons.circle,color: Colors.green,size: 18,)
                        : const Icon(Icons.circle,color: Colors.red)
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
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

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(status=="Accepted")...[
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                          radius: 9,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.check, color: Colors.white, size: 17)
                      ),
                      Text(" Driver has Accepted"),
                    ],
                  ),
                ],
                if(status=="Rejected")...[
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                          radius: 9,
                          backgroundColor: Colors.red,
                          child: Icon(Icons.close_sharp, color: Colors.white, size: 17)
                      ),
                      Text(" Driver has Declined"),
                    ],
                  )
                ],
                if(status=="None")...[
                  Row()
                ],
              ],
            )
          ],
        ),
      ),
    );
  }
}
