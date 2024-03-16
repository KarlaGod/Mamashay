import 'dart:async';
import 'package:flutter/material.dart';
import '../main.dart'; // Import your main screen

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _SignInKey = GlobalKey<FormState>();
  String? _name = '';
  String? _password = '';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/center.png',
                  width: 200,
                  height: 200, // Set width to cover the entire screen width
                  // fit: BoxFit.cover, // Set how the image should be inscribed into the box
                  alignment: Alignment.center, // Set the alignment of the image within its bounds
                ),
              ),

              Form(
              key: _SignInKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value;
                    },
                  ),

                  Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your text here',
                        border: InputBorder.none,
                      ),
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value;
                    },
                  ),)),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Center(
                      child:Container(
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: ElevatedButton(
                            onPressed: () {
                              if (_SignInKey.currentState != null && _SignInKey.currentState!.validate()) {
                                _SignInKey.currentState!.save();
                                // Process the form data
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(172, 194, 112, 1),
                              padding: const EdgeInsets.fromLTRB( 100, 20, 100, 20), // Change the background color here
                            ),
                          child: Text('Submit'),
                         )),
                          Image.asset(
                          'assets/fingerprint.png',
                          width: 130, // Set width to cover the entire screen width
                          height: 140, // Set how the image should be inscribed into the box
                          alignment: Alignment.bottomLeft, // Set the alignment of the image within its bounds
                        ),
                        ])
                    ))),

                  Center(
                  child: Image.asset(
                    'assets/sign.png',
                    width: 400,
                    height: 50, // Set width to cover the entire screen width
                    // fit: BoxFit.cover, // Set how the image should be inscribed into the box
                    alignment: Alignment.topLeft, // Set the alignment of the image within its bounds
                  ),
                ),
                ],
              ),
            )
            
            ]
          )
        )
    );
    }
    }