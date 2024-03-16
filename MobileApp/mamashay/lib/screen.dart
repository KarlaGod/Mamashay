import 'dart:async';
import 'package:flutter/material.dart';
import './main.dart'; // Import your main screen
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to main screen after 2 seconds
     Future.delayed(Duration(seconds: 5), () {
      // Navigate to the home screen after the delay
      GoRouter.of(context).go('/getStarted');
    });

    return Scaffold(
      body: Container(
        color: Color.fromRGBO(107, 123, 66, 1),
          width: double.infinity, // Set width to cover the entire screen width
        child: Center(
        child: Image.asset(
          'assets/splash_screen.png',
          width: double.infinity, // Set width to cover the entire screen width
          fit: BoxFit.cover, // Set how the image should be inscribed into the box
          alignment: Alignment.center, // Set the alignment of the image within its bounds
        ),
      ),
      )
    );
  }
}
