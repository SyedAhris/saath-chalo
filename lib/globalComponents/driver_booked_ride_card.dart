import 'package:flutter/material.dart';

class DriverBookedRideCard extends StatelessWidget {
  DriverBookedRideCard({
    Key? key,
    required this.car,
    required this.numberPlate,
    required this.journeyStart,
    required this.journeyEnd,
    required this.acStatus,
    required this.journeyDate,
    required this.journeyTime,
    required this.estCost,
    required this.passengers
  }) : super(key: key);

  String car;
  String numberPlate;
  String journeyStart;
  String journeyEnd;
  bool acStatus;
  String journeyDate;
  String journeyTime;
  int estCost;
  List<String> passengers;
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                          car.length>=20? "${car.substring(0,20)}..."
                              : car
                      ),
                      Text(numberPlate)
                    ],
                  ),
                  const SizedBox(width: 60),
                  Column(
                    children: const [
                      Icon(Icons.people_outline),
                      Text("AC",style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
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

              // Expanded(
              //   child: Column(
              //    children: [
              //      Text("Passengers: "),
              //      Expanded(
              //        child: Container(
              //          child: ListView.builder(
              //            shrinkWrap: true,
              //            itemCount: passengers.length,
              //            itemBuilder: (BuildContext context, int index) {
              //              return Container(
              //                height: 200,
              //                child: Row(
              //                  children: [
              //                    Text(index.toString()+"."+passengers[index]),
              //                    Icon(Icons.star_border),
              //                    Icon(Icons.star_border),
              //                    Icon(Icons.star_border),
              //                    Icon(Icons.star_border),
              //                    Icon(Icons.star_border),
              //                  ],
              //                ),
              //              );
              //            },
              //          ),
              //        ),
              //      )
              //    ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
