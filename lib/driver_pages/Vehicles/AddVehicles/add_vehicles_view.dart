import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/constants.dart';
import 'package:flutterdemo/globalComponents/main_button.dart';

import '../../../globalComponents/main_app_bar.dart';
import '../../../globalComponents/main_text_field.dart';
import '../VehiclesList/vehicle_list_view';

class AddVehicles extends StatefulWidget {
  const AddVehicles({Key? key}) : super(key: key);

  @override
  State<AddVehicles> createState() => _AddVehiclesState();
}

class _AddVehiclesState extends State<AddVehicles> {
  @override
  Widget build(BuildContext context) {
    TextEditingController makeController = TextEditingController();
    TextEditingController modelController = TextEditingController();
    TextEditingController yearController = TextEditingController();
    TextEditingController plateNumberController = TextEditingController();
    TextEditingController colorController = TextEditingController();

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Air Conditioning",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Switch(
                        value: true,
                        onChanged: onChanged,
                        activeColor: MainColors.primary,
                      ),
                    ],
                  ),
                ),
                MainButton(
                  text: "Add Vehicle",
                  onTap: () {
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

  void onChanged(bool value) {}
}
