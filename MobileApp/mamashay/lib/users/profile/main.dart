import 'dart:async';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

import '../../dashboard/_widgets/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
  final String? name;
  // final String? id;
  final String? email;
  final String photoURL;
  final String url;

  const UserProfile(
      {Key? key,
      required this.name,
      required this.email,
      required this.photoURL,
      // required this.id,
      required this.url})
      : super(key: key);
}

class _DashboardState extends State<UserProfile> {
  final FirestoreService _firestoreService = FirestoreService();
  // List<Map<String, dynamic>> _users = [];
  Map<String, dynamic>? _user;
  // List<Map<String, dynamic>> _products = [];

  // A function created for the purpose of creating new products

  //A function created for fetching users from firestore Database

  Future<Map<String, dynamic>?> _fetchUser(String userID) async {
    try {
      Map<String, dynamic>? user = await _firestoreService.getUserById(userID);

      _user = user;
      return user; // Added return statement
    } catch (e) {
      print("Error fetching user: $e"); // Improved error handling
      return null; // Return null in case of an error
    }
  }

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
        appBar: null,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Color.fromRGBO(107, 123, 66, 0.03),
              // color: Colors.red,
            ),
            child: SingleChildScrollView(
                child: Stack(clipBehavior: Clip.none, children: [
              Column(children: [
                Stack(clipBehavior: Clip.none, children: [
                  Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        // color: Color.fromRGBO(107, 123, 66, 0.06),
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage('assets/banner.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                // width: 00,
                                // color: Colors.grey[200],
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0,
                                                      50,
                                                      0,
                                                      0), // Add padding of 20.0 to all sides
                                                  child: IconButton(
                                                      iconSize:
                                                          15, // Adjust size as needed
                                                      icon: CircleAvatar(
                                                        radius: 20,
                                                        backgroundColor:
                                                            Color.fromRGBO(
                                                                239,
                                                                240,
                                                                237,
                                                                0.25), // Background color of the circle
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
                                                        GoRouter.of(context).go(
                                                            '/chat_notifications');
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
                                            Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0,
                                                      50,
                                                      0,
                                                      0), // Add padding of 20.0 to all sides
                                                  child: IconButton(
                                                      iconSize:
                                                          15, // Adjust size as needed
                                                      icon: CircleAvatar(
                                                        radius: 20,
                                                        backgroundColor:
                                                            Color.fromRGBO(
                                                                239,
                                                                240,
                                                                237,
                                                                0.25), // Background color of the circle
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
                                                        GoRouter.of(context).go(
                                                            '/notifications');
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
                                              padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  50,
                                                  0,
                                                  0), // Add padding of 20.0 to all sides
                                              child: IconButton(
                                                  iconSize:
                                                      15, // Adjust size as needed
                                                  icon: CircleAvatar(
                                                    radius: 20,
                                                    backgroundColor:
                                                        Color.fromRGBO(239, 240,
                                                            237, 0.25),
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
                                                    GoRouter.of(context)
                                                        .go('/settings');
                                                  }),
                                            ),
                                          ])
                                    ]))
                          ])),
                  widget.url == "true"
                      ? Positioned(
                          left: 12,
                          bottom: -40,
                          child: Container(
                              width: 2 * 40,
                              height: 2 * 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 5.0,
                                    style: BorderStyle.solid,
                                  )),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.network(
                                    "${widget.photoURL}",
                                    width: 2 * 60,
                                    height: 2 * 60,
                                    fit: BoxFit.cover,
                                  ))))
                      : Positioned(
                          left: 12,
                          bottom: -40,
                          child: Container(
                              width: 2 * 40,
                              height: 2 * 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 5.0,
                                    style: BorderStyle.solid,
                                  )),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.asset(
                                    "assets/senior.png",
                                    width: 2 * 60,
                                    height: 2 * 60,
                                    fit: BoxFit.cover,
                                  )))),
                ]),
                SizedBox(
                  height: 30,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              12, 0, 12, 0), // Add padding of 20.0 to all sides
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 20, 10,
                                    0), // Add padding of 20.0 to all sides
                                child: Text(
                                  "${widget.name}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(77, 77, 77, 1)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 0,
                                    0), // Add padding of 20.0 to all sides
                                child: Text(
                                  'Online',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(172, 194, 112, 1)),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              5, 20, 15, 0), // Add padding of 20.0 to all sides
                          child: TextButton(
                            onPressed: () {
                              GoRouter.of(context).go('/screen1');
                              print("clicked the button.");
                              // Add your onPressed logic here
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(172, 194, 112, 1)),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            child: Text(
                              'Message',
                              style: TextStyle(
                                fontSize: 16.0, // You can adjust the font size
                                color: Colors.white,
                                height: 0,
                                // You can adjust the text color
                              ),
                            ),
                          )),
                    ])
              ]),
            ]))));
  }
}
