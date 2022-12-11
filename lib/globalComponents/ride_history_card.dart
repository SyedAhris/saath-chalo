import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RideHistoryCard extends StatefulWidget {
  const RideHistoryCard({super.key});

  @override
  State<RideHistoryCard> createState() => _RideHistoryCardState();
}

class _RideHistoryCardState extends State<RideHistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10, // Change this
      shadowColor: Colors.black45,
      child: Column(
        children: [
          ListTile(
            dense: true,
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 0, 10),
                      child: Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.pin_drop_outlined,
                              color: Colors.green,
                            ),
                            Text(
                              'Main Campus IBA, Karachi',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        20,
                        1,
                        0,
                        10,
                      ),
                      child: Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.pin_drop_outlined,
                              color: Colors.red,
                            ),
                            Text(
                              'Main Campus IBA, Karachi',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 1, 0, 10),
                      child: Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time,
                            ),
                            Text(
                              '12:56 AM',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        flex: 3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 1, 0, 10),
                      child: Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                            ),
                            Text(
                              '26/11/2022',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        flex: 3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 1, 0, 10),
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Icon(
                            //   Icons.local_atm,
                            //   color: Colors.green,
                            // ),
                            Text(
                              'Est PKR 5000',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
