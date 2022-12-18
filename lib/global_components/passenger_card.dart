import 'package:flutter/material.dart';

class PassengerCard extends StatelessWidget {
  const PassengerCard(
      {Key? key,
      required this.status,
      required this.name,
      required this.journeyStart,
      required this.journeyEnd,
      required this.rating,
      required this.onTap,
      required this.onTap1,
      required this.onTap2})
      : super(key: key);
  final bool status;
  final String name;
  final String journeyStart;
  final String journeyEnd;
  final double rating;
  final VoidCallback onTap;
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/manPic.png'),
                      radius: 25,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name.length >= 15
                            ? "${name.substring(0, 15)}..."
                            : name),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: const [
                        Icon(Icons.star_border),
                      ],
                    ),
                    Column(
                      children: [
                        Text(rating.toString()),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(
                      Icons.pin_drop_sharp,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(journeyStart.length >= 30
                        ? "${journeyStart.substring(0, 30)}..."
                        : journeyStart),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.pin_drop_sharp,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(journeyEnd.length >= 30
                        ? "${journeyEnd.substring(0, 30)}..."
                        : journeyEnd),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: status == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: onTap1,
                        child: const Text(
                          "Deny",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: onTap2,
                        child: const Text(
                          "Approve",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                : null,
          )
        ],
      ),
    );
  }
}
