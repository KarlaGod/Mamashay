import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

class Settings extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(107, 123, 66, 0.06)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 50, 0,
                                  0), // Add padding of 20.0 to all sides
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: Image.asset(
                                      'assets/arrow.png',
                                      width: 2 * 8,
                                      height: 2 * 8,
                                    ),
                                    onPressed: () {
                                      GoRouter.of(context).go('/dashboard');
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 5,
                                        0), // Add padding of 20.0 to all sides
                                    child: Text(
                                      'Settings',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(107, 123, 66, 1)),
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              // width: 00,
                              // color: Colors.grey[200],
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 50, 0,
                                          0), // Add padding of 20.0 to all sides
                                      child: IconButton(
                                          iconSize: 15, // Adjust size as needed
                                          icon: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Color.fromRGBO(
                                                107,
                                                123,
                                                66,
                                                0.1), // Background color of the circle
                                            child: Image.asset(
                                              'assets/message.png',
                                              width:
                                                  17, // Set width to cover the entire screen width
                                              height:
                                                  15, // Set how the image should be inscribed into the box
                                              alignment: Alignment
                                                  .bottomLeft, // Set the alignment of the image within its bounds
                                            ),
                                          ),
                                          onPressed: () {
                                            GoRouter.of(context)
                                                .go('/chat_notifications');
                                          }),
                                    ),
                                    Positioned(
                                      right: 7,
                                      top: 60,
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(253, 193, 130, 1),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 50, 0,
                                          0), // Add padding of 20.0 to all sides
                                      child: IconButton(
                                          iconSize: 15, // Adjust size as needed
                                          icon: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Color.fromRGBO(
                                                107,
                                                123,
                                                66,
                                                0.1), // Background color of the circle
                                            child: Image.asset(
                                              'assets/notification.png',
                                              width:
                                                  15, // Set width to cover the entire screen width
                                              height:
                                                  19, // Set how the image should be inscribed into the box
                                              alignment: Alignment
                                                  .bottomLeft, // Set the alignment of the image within its bounds
                                            ),
                                          ),
                                          onPressed: () {
                                            GoRouter.of(context)
                                                .go('/notifications');
                                          }),
                                    ),
                                    Positioned(
                                      right: 7,
                                      top: 60,
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(253, 193, 130, 1),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 50, 0,
                                      0), // Add padding of 20.0 to all sides
                                  child: IconButton(
                                      iconSize: 15, // Adjust size as needed
                                      icon: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Color.fromRGBO(
                                            107,
                                            123,
                                            66,
                                            0.1), // Background color of the circle
                                        child: Image.asset(
                                          'assets/setting.png',
                                          width:
                                              19, // Set width to cover the entire screen width
                                          height:
                                              17, // Set how the image should be inscribed into the box
                                          alignment: Alignment
                                              .bottomLeft, // Set the alignment of the image within its bounds
                                        ),
                                      ),
                                      onPressed: () {}),
                                ),
                              ]))
                        ])),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          10, 0, 5, 0), // Add padding of 20.0 to all sides
                      child: Text(
                        'Languages',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(102, 102, 102, 1)),
                      ),
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/arrowdown.png',
                        width: 2 * 5,
                        height: 2 * 5,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 5, 0), // Add padding of 20.0 to all sides
                        child: TextButton(
                          onPressed: () {
                            GoRouter.of(context).go('/dashboard');
                          },
                          child: Text(
                            'Updates',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(102, 102, 102, 1)),
                          ),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 5, 5), // Add padding of 20.0 to all sides
                        child: TextButton(
                          onPressed: () {
                            GoRouter.of(context).go('/dashboard');
                          },
                          child: Text(
                            'Terms & Conditions',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(102, 102, 102, 1)),
                          ),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 5, 0), // Add padding of 20.0 to all sides
                        child: TextButton(
                          onPressed: () {
                            GoRouter.of(context).go('/dashboard');
                          },
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(102, 102, 102, 1)),
                          ),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 5, 0), // Add padding of 20.0 to all sides
                        child: TextButton(
                          onPressed: () {
                            GoRouter.of(context).go('/dashboard');
                          },
                          child: Text(
                            'LegalInfo',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(102, 102, 102, 1)),
                          ),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 5, 0), // Add padding of 20.0 to all sides
                        child: TextButton(
                          onPressed: () {
                            GoRouter.of(context).go('/dashboard');
                          },
                          child: Text(
                            'Rate Our App',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(102, 102, 102, 1)),
                          ),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 5, 0), // Add padding of 20.0 to all sides
                        child: TextButton(
                          onPressed: () {
                            GoRouter.of(context).go('/dashboard');
                          },
                          child: Text(
                            'App Version - 1.0A',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(102, 102, 102, 1)),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 200,
                ),
                Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'assets/footer.png', // Replace with your image path
                      width: double.infinity,
                    )),
              ]),
            )));
  }
}
