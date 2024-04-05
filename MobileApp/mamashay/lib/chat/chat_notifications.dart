import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import '_widgets/chat_notificationDiv.dart';

class ChatNotifications extends StatefulWidget {
  @override
  _ChatNotificationState createState() => _ChatNotificationState();
}

class _ChatNotificationState extends State<ChatNotifications> {
  bool _isActive = false;

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
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(107, 123, 66, 0.06)),
                    child: Column(children: [
                      Row(
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
                                        'Chat',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(
                                                107, 123, 66, 1)),
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
                                            iconSize:
                                                15, // Adjust size as needed
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
                                            onPressed: () {}),
                                      ),
                                      Positioned(
                                        right: 7,
                                        top: 60,
                                        child: Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                253, 193, 130, 1),
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
                                            iconSize:
                                                15, // Adjust size as needed
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
                                            color: Color.fromRGBO(
                                                253, 193, 130, 1),
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
                                            'assets/dots.png',
                                            width:
                                                6, // Set width to cover the entire screen width
                                            height:
                                                17, // Set how the image should be inscribed into the box
                                            alignment: Alignment
                                                .bottomLeft, // Set the alignment of the image within its bounds
                                          ),
                                        ),
                                        onPressed: () {
                                          // GoRouter.of(context).go('/settings');
                                        }),
                                  ),
                                ]))
                          ]),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color
                                borderRadius:
                                    BorderRadius.circular(25), // Border radius
                                border: null,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    hintText:
                                        'Search for food or any organic product...',
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(
                                            0, 0, 0, 0.2)), // Placeholder text
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
                              ))))
                    ])),
                ChatNotificationDiv(
                    ImageUrl: 'assets/senior.png',
                    messager: 'Bryan TyWils',
                    time: '9:00 pm',
                    details: 'new message sent from vendor'),
                ChatNotificationDiv(
                    ImageUrl: 'assets/seniorita.png',
                    messager: 'Ariana Grande',
                    time: '9:30 pm',
                    details: 'new message sent from vendor'),
                ChatNotificationDiv(
                    ImageUrl: 'assets/man.png',
                    messager: 'Billy Ben',
                    time: '4:00 pm',
                    details: 'new message sent from vendor'),
                ChatNotificationDiv(
                    ImageUrl: 'assets/senior.png',
                    messager: 'Martinez Lato',
                    time: '7:10 am',
                    details: 'new message sent from vendor'),
                ChatNotificationDiv(
                    ImageUrl: 'assets/man.png',
                    messager: 'John Brabass',
                    time: '10:00 am',
                    details: 'new message sent from vendor'),
                ChatNotificationDiv(
                    ImageUrl: 'assets/seniorita.png',
                    messager: 'Kim TYla',
                    time: '9:00 pm',
                    details: 'new message sent from vendor'),
                ChatNotificationDiv(
                    ImageUrl: 'assets/man.png',
                    messager: 'Tyla Jessica',
                    time: '2:00 pm',
                    details: 'new message sent from vendor'),
                ChatNotificationDiv(
                    ImageUrl: 'assets/senior.png',
                    messager: 'Gomez Ardrian',
                    time: '5:00 pm',
                    details: 'new message sent from vendor'),
                ChatNotificationDiv(
                    ImageUrl: 'assets/seniorita.png',
                    messager: 'Escobar James',
                    time: '3:00 am',
                    details: 'new message sent from vendor'),
                ChatNotificationDiv(
                    ImageUrl: 'assets/man.png',
                    messager: 'WIlliams Furry',
                    time: '4:50 am',
                    details: 'new message sent from vendor'),
                ChatNotificationDiv(
                    ImageUrl: 'assets/senior.png',
                    messager: 'Brendan Miles',
                    time: '8:00 am',
                    details: 'new message sent from vendor'),
              ]),
            )));
  }
}
