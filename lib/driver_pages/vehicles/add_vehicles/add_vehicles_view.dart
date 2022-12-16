import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/constants.dart';
import 'package:flutterdemo/driver_pages/vehicles/vehicles_list/vehicle_list_view.dart';

import '../../../global_components/main_app_bar.dart';
import '../../../global_components/main_button.dart';
import '../../../global_components/main_text_field.dart';

class AddVehicles extends StatefulWidget {
  const AddVehicles({Key? key}) : super(key: key);

  @override
  State<AddVehicles> createState() => _AddVehiclesState();
}

class _AddVehiclesState extends State<AddVehicles> {
  bool acStatus=true;

  void toggleSwitch(bool value) {

    if(acStatus == false)
    {
      setState(() {
        acStatus = true;
      });
    }
    else
    {
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
    TextEditingController noOfpassController = TextEditingController();


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
                    labelText: 'Number of Passengers',
                    hintText: '4',
                    controller: noOfpassController,
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
