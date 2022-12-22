import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/home_page/login.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        body: Center(
            child: Directionality(
          textDirection: TextDirection.ltr,
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'Agar Chalna Hi Hai Tou ...',
                textStyle: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nunito",
                    color: Colors.white),
                speed: const Duration(milliseconds: 80),
              ),
              ColorizeAnimatedText('SaathChalo',
                  textStyle: const TextStyle(
                      fontSize: 72.0,
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  speed: const Duration(milliseconds: 170),
                  colors: [
                    Colors.white,
                    Colors.orange,
                    Colors.white,
                  ]),
            ],
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 500),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
        )),
      ),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 4);
    return new Timer(
        duration,
        () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Login())));
  }

  route() {
    print("happening");
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Login()));
  }
}
