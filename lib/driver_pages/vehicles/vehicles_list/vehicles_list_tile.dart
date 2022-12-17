import 'package:flutter/material.dart';
import 'package:flutterdemo/models/vehicle_json.dart';


class VehiclesListTile extends StatelessWidget {
  const VehiclesListTile({
    Key? key,
    required this.vehicles,
  }) : super(key: key);

  final Vehicle vehicles;
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
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.people_outlined,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            vehicles.seatingCapacity.toString(),
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
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor:
                                vehicles.ac ? Colors.green : Colors.grey,
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
