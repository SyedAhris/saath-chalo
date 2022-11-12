import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/LoginPage/login_page_driver.dart';
import 'package:flutterdemo/passenger_pages/LoginPage/login_page_passenger.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: const MyHomePage(title: 'SaathChalo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Choose Login Type",
                      style: TextStyle(fontSize: 25)),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      width: 220,
                      height: 70,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginPagePassenger()));
                          },
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 25)),
                          child: const Text("Passenger")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 100),
                    child: SizedBox(
                      width: 220,
                      height: 70,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginPageDriver()));
                          },
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 25)),
                          child: const Text("Driver")),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
