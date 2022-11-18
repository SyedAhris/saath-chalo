import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../VehiclesJson.dart';
import '../VehiclesProvider.dart';

class VehiclesListView extends StatefulWidget {
  const VehiclesListView({Key? key}) : super(key: key);

  @override
  State<VehiclesListView> createState() => _VehiclesListViewState();
}

class _VehiclesListViewState extends State<VehiclesListView> {
  @override
  void initState() {
    super.initState();
    context.read<VehiclesProvider>().fetchVehicles();
  }

  @override
  Widget build(BuildContext context) {
    final vehicles = context.watch<VehiclesProvider>().vehicles;
    return Scaffold(
      body: context.watch<VehiclesProvider>().isVehiclesFetching
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                return VehiclesListTile(
                  vehicles: vehicles[index],
                );
              }),
    );
  }
}

class VehiclesListTile extends StatelessWidget {
  const VehiclesListTile({
    Key? key,
    required this.vehicles,
  }) : super(key: key);

  final VehiclesJson vehicles;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${vehicles.color} ${vehicles.make} ${vehicles.model}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/manPic.png'),
                    ),
                    Text(vehicles.numberOfPassengers.toString()),
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
                      padding: EdgeInsets.only(left: 8,),
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: vehicles.isAc ? Colors.green : Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
