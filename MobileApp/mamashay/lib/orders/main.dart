// import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import './_widgets/product_view.dart';

class Orders extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color.fromRGBO(107, 123, 66, 0.03)),
          child: Column(
            children: [
              Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(107, 123, 66, 0.06)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 50, 0,
                                0), // Add padding of 20.0 to all sides
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    'Orders',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(107, 123, 66, 1)),
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
                                        color: Color.fromRGBO(253, 193, 130, 1),
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
                                        color: Color.fromRGBO(253, 193, 130, 1),
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
                                    onPressed: () {
                                      GoRouter.of(context).go('/settings');
                                    }),
                              ),
                            ]))
                      ])),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: MediaQuery.of(context).size.height - 150,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductView(),
                        ProductView(),
                        ProductView(),
                        ProductView(),
                        ProductView(),
                        ProductView(),
                        ProductView(),
                        ProductView(),
                        ProductView(),
                        ProductView(),
                        ProductView(),
                        ProductView(),
                        ProductView(),
                        ProductView(),
                        ProductView(),
                        ProductView(),
                      ],
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}
