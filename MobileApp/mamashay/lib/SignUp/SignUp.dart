import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../main.dart'; // Import your main screen
import 'dart:ui';
import 'package:go_router/go_router.dart';
import 'widgets/_custom_button_widget.dart';
import 'widgets/_button_switch_widget.dart';
import 'textSpan.dart';
import '../SignUp/GoogleAuth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:twitter_login/twitter_login.dart';

import './twitterAuth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _SignUpKey = GlobalKey<FormState>();
  String? _name = '';
  String? _password = '';
  String? _phone_number = '';
  String? _email = '';
  final TwitterSignInProvider _twitterSignInProvider = TwitterSignInProvider();
  final GoogleAuthService _authService = GoogleAuthService();

  Future<void> _authenticate(BuildContext context) async {
    try {
      // This is where you prewarm the Custom Tabs
      // await FlutterWebAuth.authenticate(
      //   url: '/dashboard', // Dummy URL for pre-warming
      //   callbackUrlScheme: 'myapp',
      // );

      final user = await _twitterSignInProvider.signInWithTwitter(context);
      if (user != null) {
        await ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Authentication successful! User: ${user.displayName}')),
        );

        String _user = '${user.displayName}';
        List<String>? username;
        user.displayName == ""
            ? username = []
            : username = user.displayName?.split(" ");
        print(user.email);

        GoRouter.of(context).go('/dashboard/${username?[0]}/${user.email}',
            extra: user.photoURL);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Authentication failed')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

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
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HalfBorderButton(
                          text: "Sign In",
                          isActive: false,
                          onPressed: () {
                            GoRouter.of(context).go('/signIn');
                          },
                        ),
                        HalfBorderButton(
                            text: "Sign Up",
                            isActive: true,
                            onPressed: () {
                              GoRouter.of(context).go('SignUP');
                            })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: _SignUpKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(172, 194, 112, 1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ), // Ch
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(172, 194, 112, 1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(172, 194, 112, 1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  labelText: 'Username',
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(172, 194, 112, 1)),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _name = value;
                                },
                              ),
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(172, 194, 112, 1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ), // Change unfocused border color
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(172, 194, 112, 1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(172, 194, 112, 1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  labelText: 'Phone Number',
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(172, 194, 112, 1)),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please enter your mobile number';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _phone_number = value;
                                },
                              ),
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(172, 194, 112, 1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ), // Change unfocused border color
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(172, 194, 112, 1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(172, 194, 112, 1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  labelText: 'Email Address',
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(172, 194, 112, 1)),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please enter your email address';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _email = value;
                                },
                              ),
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(172, 194, 112, 1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ), // Change unfocused border color
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(172, 194, 112, 1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(172, 194, 112, 1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(172, 194, 112, 1)),
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
                              ),
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(172, 194, 112, 1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ), // Change unfocused border color
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(172, 194, 112, 1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(172, 194, 112, 1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  labelText: 'Confirm Password',
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(172, 194, 112, 1)),
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
                              ),
                            )),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: Center(
                                    child: Container(
                                        width: 400,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      if (_SignUpKey
                                                                  .currentState !=
                                                              null &&
                                                          _SignUpKey
                                                              .currentState!
                                                              .validate()) {
                                                        _SignUpKey.currentState!
                                                            .save();
                                                        // Process the form data

                                                        print(_name);
                                                        print(_password);
                                                      }
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Color.fromRGBO(
                                                              172, 194, 112, 1),
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          100,
                                                          20,
                                                          100,
                                                          20), // Change the background color here
                                                    ),
                                                    child: Text(
                                                      'Submit',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  )),
                                              IconButton(
                                                  iconSize:
                                                      60, // Adjust size as needed
                                                  icon: CircleAvatar(
                                                    radius: 27,
                                                    backgroundColor: Color.fromRGBO(
                                                        172,
                                                        194,
                                                        112,
                                                        1), // Background color of the circle
                                                    child: Image.asset(
                                                      'assets/fingerprint.png',
                                                      width:
                                                          25, // Set width to cover the entire screen width
                                                      height:
                                                          30, // Set how the image should be inscribed into the box
                                                      alignment: Alignment
                                                          .bottomLeft, // Set the alignment of the image within its bounds
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    // Add your onPressed logic here

                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            content: Stack(
                                                              alignment: Alignment
                                                                  .bottomCenter,
                                                              children: <Widget>[
                                                                BackdropFilter(
                                                                  filter: ImageFilter
                                                                      .blur(
                                                                          sigmaX:
                                                                              5,
                                                                          sigmaY:
                                                                              5),
                                                                  child:
                                                                      Container(
                                                                    width: 350,
                                                                    height: double
                                                                        .infinity,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20.0),
                                                                  width: 500,
                                                                  height: 240,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius:
                                                                              BorderRadius.all(
                                                                            Radius.circular(20.0),
                                                                          )),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: <Widget>[
                                                                      Center(
                                                                        // width:
                                                                        // 300,
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            TextHighlight(),
                                                                            ButtonSwitch(
                                                                              value: false,
                                                                              onChanged: (value) {
                                                                                // Handle switch value change here
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              40),
                                                                      Center(
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/fingerprint_green.png',
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              50, // Set width to cover the entire screen width
                                                                          // fit: BoxFit.cover, // Set how the image should be inscribed into the box
                                                                          alignment:
                                                                              Alignment.center, // Set the alignment of the image within its bounds
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              55),
                                                                      Container(
                                                                          width:
                                                                              200,
                                                                          child: Center(
                                                                              child: Text('Place your finger on the fingerprint scanner',
                                                                                  textAlign: TextAlign.center,
                                                                                  style: TextStyle(
                                                                                    color: Color.fromRGBO(
                                                                                      153,
                                                                                      153,
                                                                                      153,
                                                                                      1,
                                                                                    ),
                                                                                  )))),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        });
                                                  }),
                                            ])))),
                            Container(
                                height: 300,
                                child: Column(children: [
                                  Center(
                                    child: Image.asset(
                                      'assets/sign.png',
                                      width: 325,
                                      height:
                                          40, // Set width to cover the entire screen width
                                      // fit: BoxFit.cover, // Set how the image should be inscribed into the box
                                      alignment: Alignment
                                          .topLeft, // Set the alignment of the image within its bounds
                                    ),
                                  ),

                                  Container(
                                      width: 150,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                                onTap: () async {
                                                  User? user =
                                                      await _authService
                                                          .signInWithGoogle();
                                                  print(
                                                      '\n\n\n ${user} \n\n\n');
                                                  if (user != null) {
                                                    await ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                          content: Text(
                                                              'Signed in as ${user.displayName}')),
                                                    );
                                                    String? value =
                                                        user.displayName;
                                                    List<String>? username =
                                                        value?.split(" ");
                                                    GoRouter.of(context).go(
                                                        '/dashboard/${username?[0]}/${user.email}',
                                                        extra: user.photoURL);
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                          content: Text(
                                                              'Sign in failed')),
                                                    );
                                                  }
                                                },
                                                child: Image.asset(
                                                  'assets/google.png',
                                                  width:
                                                      50, // Set width to cover the entire screen width
                                                  height:
                                                      50, // Set how the image should be inscribed into the box
                                                  alignment: Alignment
                                                      .bottomLeft, // Set the alignment of the image within its bounds
                                                )),
                                            GestureDetector(
                                                onTap: () =>
                                                    _authenticate(context),
                                                child: Image.asset(
                                                  'assets/twitter.png',
                                                  width:
                                                      50, // Set width to cover the entire screen width
                                                  height:
                                                      50, // Set how the image should be inscribed into the box
                                                  alignment: Alignment
                                                      .bottomLeft, // Set the alignment of the image within its bounds
                                                )),
                                          ]))
                                  // ))),
                                ]))
                          ]))
                ]))));
  }
}
