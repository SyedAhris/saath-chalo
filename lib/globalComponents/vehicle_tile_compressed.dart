import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/constants.dart';

class VehicleTileCompressed extends StatelessWidget {
  const VehicleTileCompressed(
      {Key? key,
      required this.car,
      required this.numberPlate,
      this.width = 360,
      this.height = 50})
      : super(key: key);
  final String car;
  final String numberPlate;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: () => {},
        style: TextButton.styleFrom(
            primary: Colors.white, backgroundColor: MainColors.primary),
        child: Row(
          children: [
            Icon(Icons.car_crash),
            Text(car),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(numberPlate))),
          ],
        ),
      ),
    );
  }
}
