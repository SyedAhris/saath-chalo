import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutterdemo/constants/constants.dart';
import 'package:google_directions_api/google_directions_api.dart';
import "package:google_maps_webservice/geocoding.dart";
import 'package:google_maps_webservice/places.dart';

class LocationTextField extends StatefulWidget {
  const LocationTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      this.controller,
      this.onSubmitted})
      : super(key: key);
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final void Function(String)? onSubmitted;

  @override
  State<LocationTextField> createState() => _LocationTextFieldState();
}

class _LocationTextFieldState extends State<LocationTextField> {
  // late TextEditingController controller;

  late List<GeoCoord>? waypoints;

  Future<String> callSearch() async {
    Prediction? prediction = await PlacesAutocomplete.show(
      offset: 0,
      radius: 1000,
      types: ['establishment'],
      strictbounds: false,
      region: "pk",
      mode: Mode.overlay, // Mode.fullscreen
      language: "en",
      components: [Component(Component.country, "pk")],
      context: context,
      apiKey: 'AIzaSyC-5vfdeyQ3AYLbu6p720MjcqL0THkLCIE',
    );
    print('${prediction?.description}  prediction');
    return prediction?.description ?? "";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: widget.onSubmitted,
      onTap: () async {
        widget.controller?.text = await callSearch();
      },
      controller: widget.controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: MainColors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: MainColors.grey)),
          labelText: widget.labelText,
          hintText: widget.hintText),
    );
  }
}
