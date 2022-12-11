import 'package:flutter/material.dart';
import 'package:flutterdemo/passenger_pages/passenger_ride_history/passenger_ride_history.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'constants/constants.dart';
import 'driver_pages/Vehicles/VehiclesList/VehicleListView.dart';
import 'driver_pages/Vehicles/VehiclesProvider.dart';
import 'home_page/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VehiclesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaathChalo',
      theme: ThemeData(
        textTheme:
            GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme.apply(
                  bodyColor: const Color(0xff36454F),
                )),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: MainColors.primary,
          secondary: MainColors.secondary,
        ),
      ),
      home: PassengerRideHistory(),
    );
  }
}
