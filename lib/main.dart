import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/home_page/sign_up.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_provider.dart';
import 'package:flutterdemo/providers_repositories/driver/passenger_requests/passenger_request_provider.dart';
import 'package:flutterdemo/providers_repositories/driver/ride_history/driver_ride_history_provider.dart';
import 'package:flutterdemo/providers_repositories/driver/scheduled_rides/driver_scheduled_rides_provider.dart';
import 'package:flutterdemo/providers_repositories/driver/scheduled_rides_detailed/driver_scheduled_rides_detailed_provider.dart';
import 'package:flutterdemo/providers_repositories/passenger/home/home_provider.dart';
import 'package:google_directions_api/google_directions_api.dart';
import 'package:flutterdemo/providers_repositories/passenger/booked_rides/booked_rides_provider.dart';
import 'package:flutterdemo/providers_repositories/passenger/booked_rides_details/booked_rides_details_provider.dart';
import 'package:flutterdemo/providers_repositories/passenger/ride_history_details/ride_history_details_provider.dart';
import 'package:flutterdemo/providers_repositories/passenger/rides_history/ride_history_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'constants/constants.dart';
import 'driver_pages/vehicles/vehicles_provider.dart';
import 'firebase_options.dart';
import 'home_page/home_page.dart';

void main() async {
  DirectionsService.init('AIzaSyC-5vfdeyQ3AYLbu6p720MjcqL0THkLCIE');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VehiclesProvider()),
        ChangeNotifierProvider(create: (context) => PassengerHomeProvider()),
        ChangeNotifierProvider(create: (context) => CurrentUserProvider()),
        ChangeNotifierProvider(create: (context) => RideHistoryProvider()),
        ChangeNotifierProvider(create: (context) => RideHistoryDetailsProvider()),
        ChangeNotifierProvider(create: (context) => BookedRidesProvider()),
        ChangeNotifierProvider(create: (context) => BookedRidesDetailProvider()),
        ChangeNotifierProvider(create: (context) => DriverRideHistoryProvider()),
        ChangeNotifierProvider(create: (context) => DriverScheduledRidesProvider()),
        ChangeNotifierProvider(create: (context) => DriverScheduledRidesDetailedProvider()),
        ChangeNotifierProvider(create: (context) => PassengerRequestProvider()),
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
      home: const HomePage(title: 'SaathChalo'),
    );
  }
}
