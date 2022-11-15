import 'package:flutter/material.dart';
import 'package:flutterdemo/globalComponents/main_app_bar.dart';
import 'package:flutterdemo/globalComponents/main_button.dart';
import 'package:flutterdemo/passenger_pages/passenger_home/location_text_field.dart';

class PassengerHome extends StatelessWidget {
  const PassengerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: "Home"),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.none,
                image: NetworkImage(
                    "https://www.researchgate.net/profile/Noor-Saher/publication/320758246/figure/fig1/AS:614266084282384@1523463855302/Map-showing-the-study-site-Hawks-Bay-Karachi-Pakistan-Google-Map_Q640.jpg"))),
        child: SizedBox(
          //needs to be changed so automatically fits whole screen
          height: double.infinity,
          // height: 631,
          child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  LocationTextField(
                    labelText: "PickUp",
                    hintText: "e.g IBA - Karachi University",
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: LocationTextField(
                        labelText: "DropOff", hintText: "e.g Chaar Meenar"),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: MainButton(text: "Search")),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
