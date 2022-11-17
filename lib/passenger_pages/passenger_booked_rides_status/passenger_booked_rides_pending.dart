import 'package:flutter/material.dart';
import 'package:flutterdemo/globalComponents/main_app_bar.dart';

class PassengerBookedRidesPending extends StatefulWidget {
  const PassengerBookedRidesPending({Key? key}) : super(key: key);

  @override
  State<PassengerBookedRidesPending> createState() => _PassengerBookedRidesPendingState();
}

class _PassengerBookedRidesPendingState extends State<PassengerBookedRidesPending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: "SaathChalo"),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.none,
                image: Image.asset('assets/images/mapBackground.jpg') as ImageProvider
            )
        ),
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(

          ),
        ),
      )
    );
  }
}
