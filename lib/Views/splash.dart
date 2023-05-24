import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:finalflutterproject/Views/home.dart';

import 'package:flutter/material.dart';




class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: SizedBox(
          width: 60,
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/meteo_logo.png")
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(253, 193, 223, 233),
        nextScreen:  const Home());
  }
}
