import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_1/screens/Onboarding/onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 179,
          width: 149,
          child: Image.asset("assets/images/Vector.png"),
        ),
      ),
    );
  }
}
