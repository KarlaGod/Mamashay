import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'SignUp.dart'; // Import your main screen

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // // Navigate to main screen after 2 seconds
    // Timer(Duration(seconds: 2), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (context) => MyApp(),
    //     ),
    //   );
    // });

    return Scaffold(
        appBar: null,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      'assets/mamashay.png',
                      width: 200,
                      height: 200, // Set width to cover the entire screen width
                      // fit: BoxFit.cover, // Set how the image should be inscribed into the box
                      alignment: Alignment
                          .center, // Set the alignment of the image within its bounds
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 218, 218, 218)
                                  .withOpacity(0.2), // Shadow color
                              spreadRadius: 15, // Spread radius
                              blurRadius: 30, // Blur radius
                              offset: Offset(6, 6), // Offset
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            GoRouter.of(context).go('/signIn');
                            print("clicked the button.");
                            // Add your onPressed logic here
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(172, 194, 112, 1)),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 16.0, // You can adjust the font size
                              color: Colors.white,
                              height: 2.5,
                              // You can adjust the text color
                            ),
                          ),
                        ),
                      ) // Your content goes here
                      )
                ])));
  }
}
