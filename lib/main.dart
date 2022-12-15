import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/providers_repositories/current_user/current_user_provider.dart';
import 'package:google_directions_api/google_directions_api.dart';
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
        ChangeNotifierProvider(create: (context) => CurrentUserProvider()),
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
