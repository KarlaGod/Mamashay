import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../main.dart'; // Import your main screen
import 'dart:ui';
import 'package:go_router/go_router.dart';
import './_custom_button_widget.dart';
import '../SignUp/twitterAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:uni_links/uni_links.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _SignInKey = GlobalKey<FormState>();
  String? _name = '';
  String? _password = '';
  final TwitterSignInProvider _twitterSignInProvider = TwitterSignInProvider();

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

        GoRouter.of(context).go('/dashboard/${username?[0]}/${user.email}');
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
                    height: 120,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/center.png',
                      width: 200,
                      height: 200, // Set width to cover the entire screen width
                      // fit: BoxFit.cover, // Set how the image should be inscribed into the box
                      alignment: Alignment
                          .center, // Set the alignment of the image within its bounds
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HalfBorderButton(
                          text: "Sign In",
                          isActive: true,
                          onPressed: () {
                            GoRouter.of(context).go('/SignIn');
                          },
                        ),
                        HalfBorderButton(
                            text: "SIgn Up",
                            isActive: false,
                            onPressed: () {
                              GoRouter.of(context).go('/SignUP');
                            })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: _SignInKey,
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
                                                      if (_SignInKey
                                                                  .currentState !=
                                                              null &&
                                                          _SignInKey
                                                              .currentState!
                                                              .validate()) {
                                                        _SignInKey.currentState!
                                                            .save();
                                                        // Process the form data
                                                        GoRouter.of(context)
                                                            .go('/dashboard');
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
                                                                      Text(
                                                                        'Biometrics',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            color: Color.fromRGBO(
                                                                                02,
                                                                                102,
                                                                                102,
                                                                                1)),
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
                                            Image.asset(
                                              'assets/google.png',
                                              width:
                                                  50, // Set width to cover the entire screen width
                                              height:
                                                  50, // Set how the image should be inscribed into the box
                                              alignment: Alignment
                                                  .bottomLeft, // Set the alignment of the image within its bounds
                                            ),
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
