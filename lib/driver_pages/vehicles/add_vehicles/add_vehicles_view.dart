import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/constants.dart';
import 'package:flutterdemo/driver_pages/vehicles/vehicles_list/vehicle_list_view.dart';
import 'package:flutterdemo/models/vehicle_json.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_provider.dart';
import 'package:provider/provider.dart';

import '../../../global_components/main_app_bar.dart';
import '../../../global_components/main_button.dart';
import '../../../global_components/main_text_field.dart';
import '../../../providers_repositories/driver/vehicles/vehicles_provider.dart';

class AddVehicles extends StatefulWidget {
  const AddVehicles({Key? key}) : super(key: key);

  @override
  State<AddVehicles> createState() => _AddVehiclesState();
}

class _AddVehiclesState extends State<AddVehicles> {
  bool acStatus = true;

  void toggleSwitch(bool value) {
    if (acStatus == false) {
      setState(() {
        acStatus = true;
      });
    } else {
      setState(() {
        acStatus = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController makeController = TextEditingController();
    TextEditingController modelController = TextEditingController();
    TextEditingController yearController = TextEditingController();
    TextEditingController plateNumberController = TextEditingController();
    TextEditingController colorController = TextEditingController();
    TextEditingController seatingCapacityController = TextEditingController();

    final currentCustomer = context.watch<CurrentUserProvider>().currentCustomer;

    return Scaffold(
      appBar: const MainAppBar(title: 'Add Vehicles'),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MainTextField(
                    labelText: 'Make',
                    hintText: 'Suzuki',
                    controller: makeController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MainTextField(
                    labelText: 'Model',
                    hintText: 'WagonR',
                    controller: modelController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MainTextField(
                    labelText: 'Year',
                    hintText: '2019',
                    controller: yearController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MainTextField(
                    labelText: 'Plate Number',
                    hintText: 'ABC-123',
                    controller: plateNumberController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MainTextField(
                    labelText: 'Color',
                    hintText: 'Black',
                    controller: colorController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MainTextField(
                    labelText: 'Seating Capacity',
                    hintText: '4',
                    controller: seatingCapacityController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Air Conditioning",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Switch(
                        value: acStatus,
                        onChanged: toggleSwitch,
                        activeColor: MainColors.primary,
                      ),
                    ],
                  ),
                ),
                MainButton(
                  text: "Add Vehicle",
                  onTap: () {
                    Vehicle veh = Vehicle(
                        color: colorController.text,
                        make: makeController.text,
                        model: modelController.text,
                        year: yearController.text,
                        ac: acStatus,
                        carType: "carType",
                        seatingCapacity:
                            int.parse(seatingCapacityController.text),
                        imageLink: "",
                        plateNumber: plateNumberController.text,
                        isDelete: false);
                    context.read<VehiclesProvider>().addVehicles(veh, currentCustomer);
                    context.read<CurrentUserProvider>().updateCustomer();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VehiclesListView()),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
