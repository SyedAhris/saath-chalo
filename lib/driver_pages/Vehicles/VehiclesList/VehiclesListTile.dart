import 'package:flutter/material.dart';

import '../VehiclesJson.dart';

class VehiclesListTile extends StatelessWidget {
  const VehiclesListTile({
    Key? key,
    required this.vehicles,
  }) : super(key: key);

  final VehiclesJson vehicles;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(.0),
          child: ListTile(
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${vehicles.color} ${vehicles.make} ${vehicles.model}",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.people_outlined,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            vehicles.numberOfPassengers.toString(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(vehicles.plateNumber),
                    Row(
                      children: [
                        const Text(
                          "AC",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 8,
                          ),
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor:
                            vehicles.isAc ? Colors.green : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
