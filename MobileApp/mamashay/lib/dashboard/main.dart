import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import '_widgets/vendors/_VendorScroll.dart';
import '_widgets/products/productScroll.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                              padding: EdgeInsets.fromLTRB(15, 50, 15,
                                  0), // Add padding of 20.0 to all sides
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        'assets/man.png',
                                        width: 2 * 15,
                                        height: 2 * 15,
                                        fit: BoxFit.cover,
                                      )),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(8, 20, 10,
                                            0), // Add padding of 20.0 to all sides
                                        child: Text(
                                          'Emeka Jordan',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  77, 77, 77, 1)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 75,
                                            0), // Add padding of 20.0 to all sides
                                        child: Text(
                                          'User',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  153, 153, 153, 1)),
                                          textAlign: TextAlign.left,
                                        ),
                                      )
                                    ],
                                  )
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
                                      onPressed: () {
                                        GoRouter.of(context).go('/settings');
                                      }),
                                ),
                              ]))
                        ])),
                Center(
                  child: Image.asset(
                    'assets/mama.png',
                    width: 200, // Set width to cover the entire screen width
                    height:
                        200, // Set how the image should be inscribed into the box
                    alignment: Alignment
                        .bottomLeft, // Set the alignment of the image within its bounds
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          10, 0, 0, 0), // Add padding of 20.0 to all sides
                      child: IconButton(
                          iconSize: 15, // Adjust size as needed
                          icon: CircleAvatar(
                            radius: 20,
                            backgroundColor: Color.fromRGBO(107, 123, 66,
                                1), // Background color of the circle
                            child: Image.asset(
                              'assets/Icons.png',
                              width:
                                  17, // Set width to cover the entire screen width
                              height:
                                  15, // Set how the image should be inscribed into the box
                              alignment: Alignment
                                  .bottomLeft, // Set the alignment of the image within its bounds
                            ),
                          ),
                          onPressed: () {}),
                    ),
                    Expanded(
                        child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                  107, 123, 66, 0.06), // Background color
                              borderRadius:
                                  BorderRadius.circular(25), // Border radius
                              border: null,
                            ),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText:
                                      'Search for food or any organic product...',
                                  hintStyle: TextStyle(
                                      color: Color.fromRGBO(179, 179, 179,
                                          1)), // Placeholder text
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ), // Ch
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  // Border style
                                ),
                              ),
                            )))),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 10, 0), // Add padding of 20.0 to all sides
                      child: IconButton(
                          iconSize: 15, // Adjust size as needed
                          icon: CircleAvatar(
                            radius: 20,
                            backgroundColor: Color.fromRGBO(107, 123, 66,
                                1), // Background color of the circle
                            child: Image.asset(
                              'assets/search.png',
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
                  ],
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        15, 50, 15, 0), // Add padding of 20.0 to all sides
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(253, 193, 130, 1),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Favourite Vendors',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(77, 77, 77, 1)),
                        ),
                      ],
                    )),
                Vendors(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(107, 123, 66, 0.06),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              IconButton(
                                  iconSize: 15, // Adjust size as needed
                                  icon: Image.asset(
                                    'assets/message.png',
                                    width:
                                        20, // Set width to cover the entire screen width
                                    height:
                                        17, // Set how the image should be inscribed into the box
                                    alignment: Alignment
                                        .bottomLeft, // Set the alignment of the image within its bounds
                                  ),
                                  onPressed: () {}),
                              Text(
                                textAlign: TextAlign.center,
                                'Messages',
                                style: TextStyle(
                                  color: Color.fromRGBO(107, 123, 66, 1),
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        )),
                    Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(107, 123, 66, 0.06),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              IconButton(
                                  iconSize: 15, // Adjust size as needed
                                  icon: Image.asset(
                                    'assets/Cart.png',
                                    width:
                                        20, // Set width to cover the entire screen width
                                    height:
                                        17, // Set how the image should be inscribed into the box
                                    alignment: Alignment
                                        .bottomLeft, // Set the alignment of the image within its bounds
                                  ),
                                  onPressed: () {}),
                              Container(
                                  // decoration: BoxDecoration(border: Border),
                                  child: Text(
                                textAlign: TextAlign.center,
                                'Orders',
                                style: TextStyle(
                                  color: Color.fromRGBO(107, 123, 66, 1),
                                  fontSize: 16,
                                ),
                              ))
                            ],
                          ),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        15, 20, 15, 0), // Add padding of 20.0 to all sides
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(253, 193, 130, 1),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          'Favourite Products',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(77, 77, 77, 1)),
                        ),
                      ],
                    )),
                Products(),
              ]),
            )));
  }
}
