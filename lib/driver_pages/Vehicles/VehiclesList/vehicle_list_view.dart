import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/Vehicles/AddVehicles/add_vehicles_view.dart';
import 'package:flutterdemo/globalComponents/main_app_bar.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../vehicles_provider.dart';
import 'vehicles_list_tile.dart';

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
      appBar: const MainAppBar(
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
            MaterialPageRoute(builder: (context) => const AddVehicles()),
          );
        },
        backgroundColor: MainColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
