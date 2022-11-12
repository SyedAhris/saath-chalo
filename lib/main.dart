import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page/home_page.dart';

void main() {
  runApp(const MyApp());
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
          primary: const Color(0xffF65E5D),
          secondary: const Color(0xffFF9494),
        ),
      ),
      home: const HomePage(title: 'SaathChalo'),
    );
  }
}
