import 'package:flutter/material.dart';
import 'package:flutterdemo/driver_pages/login_page_driver.dart';
import 'package:flutterdemo/passenger_pages/login_page_passenger.dart';
import 'package:flutterdemo/passenger_pages/signup_page_passenger.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme.apply(
              bodyColor: const Color(0xff36454F),
         )
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xffF65E5D),
          secondary: const Color(0xffFF9494),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final int _counter = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPagePassenger()));
          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignupPassenger()));
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignupPassenger()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
