import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/vehicles/add_vehicles/add_vehicles_view.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../global_components/main_app_bar.dart';
import 'vehicles_list_tile.dart';

class VehiclesListView extends StatefulWidget {
  const VehiclesListView({Key? key}) : super(key: key);

  @override
  State<VehiclesListView> createState() => _VehiclesListViewState();
}

class _VehiclesListViewState extends State<VehiclesListView> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<CurrentUserProvider>().updateCustomer();
  }

  @override
  Widget build(BuildContext context) {
    final vehicles =
        context.watch<CurrentUserProvider>().currentCustomer.vehicles;
    return Scaffold(
      appBar: const MainAppBar(
        title: 'Vehicles',
      ),
      body: ListView.builder(
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
