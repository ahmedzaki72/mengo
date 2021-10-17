import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mengo/screens/login_screen/login_screen.dart';
import 'package:mengo/screens/onBoarding_screen/on_boarding_screen.dart';
import 'package:mengo/screens/project_screen/project_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash_screen";
  String token;
  bool turnOn;
  SplashScreen({
    this.token,
    this.turnOn,
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 4),
        widget.turnOn != true ? ()=> {
          Navigator.pushReplacementNamed(
              context, OnBoardingScreen.routeName)
        } :
        widget.token != null
            ? () => {
                  Navigator.pushReplacementNamed(
                      context, ProjectScreen.routeName)
                }
            : () => {
                  Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName),
                });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Splash screen56.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/logo.png'),
            ),
            Image(
              image: AssetImage('assets/images/Capture3.png'),
            ),
          ],
        ),
      ),
    );
  }
}
