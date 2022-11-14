import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/globalComponents/card_list.dart';

class PassengerRideHistory extends StatelessWidget {
  const PassengerRideHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: <Widget>[
                  Text(
                    "Approved",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  Icon(
                    Icons.check_circle_outline_outlined,
                    size: 28,
                    color: Colors.green,
                  ),
                ],
              ),
              MyWidget(),
              Row(
                children: <Widget>[
                  Text(
                    "Pending",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  Icon(
                    Icons.access_time_outlined,
                    size: 28,
                    color: Colors.grey,
                  ),
                ],
              ),
              MyWidget(),
              Row(
                children: <Widget>[
                  Text(
                    "Rejected",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  Icon(
                    Icons.cancel_outlined,
                    size: 28,
                    color: Colors.red,
                  ),
                ],
              ),
              MyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
