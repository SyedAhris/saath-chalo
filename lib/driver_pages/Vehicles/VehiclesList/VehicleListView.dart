import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/Vehicles/AddVehicles/AddVehiclesView.dart';
import 'package:flutterdemo/globalComponents/main_app_bar.dart';

import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../VehiclesJson.dart';
import '../VehiclesProvider.dart';
import 'VehiclesListTile.dart';

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
      appBar: MainAppBar(
        title: 'Vehicles',
      ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddVehicles()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: MainColors.primary,
      ),
    );
  }
}

