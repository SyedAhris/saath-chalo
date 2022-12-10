import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class RideListTile extends StatelessWidget {
  const RideListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(''),
              radius: 30,
            ),
            title: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Hamza',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      flex: 4,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.star),
                          Text(' 5'),
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text(
                        'Black Suzuki WagonR',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: const [
                          Icon(Icons.people),
                          Text(
                            '2/3',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text(
                        'BKL-101',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: const [
                          Icon(Icons.ac_unit),
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 0, 10),
                child: Expanded(
                  child: Row(
                    children: const [
                      Icon(
                        Icons.pin_drop_outlined,
                        color: Colors.green,
                      ),
                      Text(
                        'Main Campus IBA, Karachi',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                        ),
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
                padding: const EdgeInsets.fromLTRB(
                  20,
                  5,
                  0,
                  10,
                ),
                child: Expanded(
                  child: Row(
                    children: const [
                      Icon(
                        Icons.pin_drop_outlined,
                        color: Colors.red,
                      ),
                      Text(
                        'Main Campus IBA, Karachi',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                        ),
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
                padding: const EdgeInsets.fromLTRB(20, 5, 0, 10),
                child: Expanded(
                  flex: 3,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.access_time,
                      ),
                      Text(
                        '12:56 AM',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 0, 10),
                child: Expanded(
                  flex: 3,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.calendar_month,
                      ),
                      Text(
                        '26/11/2022',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 5, 0, 10),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      // Icon(
                      //   Icons.local_atm,
                      //   color: Colors.green,
                      // ),
                      Text(
                        'Est PKR 5000',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                  ),
                  Text(
                    'Driver has accepted',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Nunito',
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
