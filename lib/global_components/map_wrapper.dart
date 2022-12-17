import 'package:flutter/material.dart';
import 'package:flutterdemo/global_components/google_map.dart';

class MapWrapper extends StatelessWidget {
  const MapWrapper({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(child: MapSample()),
        Positioned(child: child)
      ],
    );
  }
}
