import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mamashay/orders/_widgets/product_view.dart';
import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../dashboard/_widgets/firestore_service.dart';

class MainUserProfile extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
  final String? name;
  // final String? id;
  final String? email;
  final String photoURL;
  final String url;

  const MainUserProfile(
      {Key? key,
      required this.name,
      required this.email,
      required this.photoURL,
      // required this.id,
      required this.url})
      : super(key: key);
}

class _DashboardState extends State<MainUserProfile> {
  final FirestoreService _firestoreService = FirestoreService();
  // List<Map<String, dynamic>> _users = [];
  Map<String, dynamic>? _user;
  // List<Map<String, dynamic>> _products = [];

  // A function created for the purpose of creating new products

  //A function created for fetching users from firestore Database

  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

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
                              'Edit Profile',
                              style: TextStyle(
                                fontSize: 16.0, // You can adjust the font size
                                color: Colors.white,
                                height: 0,
                                // You can adjust the text color
                              ),
                            ),
                          )),
                    ]),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: 'Description: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          // text: showFullText
                          text:
                              'we sell homemade food, drinks and snacks, we also have event packages as well. you can always contact us from Monday to Saturday for our services and we will respond immediately.',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    // overflow: TextOverflow.ellipsis,
                    // maxLines: showFullText ? null : 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 10),
                  child: Row(
                    children: [
                      Container(
                          width: 25,
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color:
                                          Color.fromRGBO(204, 204, 204, 1)))),
                          child: Icon(
                            Icons.phone_in_talk,
                            size: 15.0,
                            color: Color.fromRGBO(172, 194, 112, 1),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        '+234 123 456 7890',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                    children: [
                      Container(
                          width: 25,
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color:
                                          Color.fromRGBO(204, 204, 204, 1)))),
                          child: Icon(
                            Icons.gps_fixed_rounded,
                            size: 15.0,
                            color: Color.fromRGBO(172, 194, 112, 1),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Rumudara Port Hacourt',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Row(
                    children: [
                      Container(
                          width: 25,
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color:
                                          Color.fromRGBO(204, 204, 204, 1)))),
                          child: Icon(
                            Icons.calendar_month,
                            size: 15.0,
                            color: Color.fromRGBO(172, 194, 112, 1),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Available: Mon - Sat * 9:00am - 6:00pm',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Container(
                        // width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(
                              color: Color.fromARGB(125, 231, 230, 230),
                              width: 1.0,
                            ),
                            right: BorderSide(
                              color: Color.fromARGB(125, 231, 230, 230),
                              width: 1.0,
                            ),
                            top: BorderSide(
                              color: Color.fromARGB(125, 231, 230, 230),
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              color: Color.fromARGB(125, 231, 230, 230),
                              width: 1.0,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                child: AspectRatio(
                                  aspectRatio: 8 / 2,
                                  // Define your aspect ratio
                                  child: GestureDetector(
                                      onTap: () {
                                        _pickImage();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              15.0), // Optional: Add border radius
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/upload_image_banner.png'), // Replace 'your_image.jpg' with your image asset
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ))),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Container(
                      // width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          left: BorderSide(
                            color: Color.fromARGB(125, 231, 230, 230),
                            width: 1.0,
                          ),
                          right: BorderSide(
                            color: Color.fromARGB(125, 231, 230, 230),
                            width: 1.0,
                          ),
                          top: BorderSide(
                            color: Color.fromARGB(125, 231, 230, 230),
                            width: 1.0,
                          ),
                          bottom: BorderSide(
                            color: Color.fromARGB(125, 231, 230, 230),
                            width: 1.0,
                          ),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                child: GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Your Shop",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    107, 123, 66, 1)),
                                          ),
                                        ])))
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                      // width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          left: BorderSide(
                            color: Color.fromARGB(125, 231, 230, 230),
                            width: 1.0,
                          ),
                          right: BorderSide(
                            color: Color.fromARGB(125, 231, 230, 230),
                            width: 1.0,
                          ),
                          top: BorderSide(
                            color: Color.fromARGB(125, 231, 230, 230),
                            width: 1.0,
                          ),
                          bottom: BorderSide(
                            color: Color.fromARGB(125, 231, 230, 230),
                            width: 1.0,
                          ),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  60,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Color.fromRGBO(
                                                              204,
                                                              204,
                                                              204,
                                                              0.3)))),
                                              child: Text(
                                                "My Account",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromRGBO(
                                                        107, 123, 66, 1)),
                                              )),
                                          Container(
                                            child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 20, 10, 10),
                                                child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color.fromRGBO(
                                                          107, 123, 66, 0.06),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(20),
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            child: Image.asset(
                                                              "assets/person.png",
                                                              width: 2 * 20,
                                                              height: 2 * 20,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            "Personal Data",
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        179,
                                                                        179,
                                                                        179,
                                                                        1)),
                                                          )
                                                        ],
                                                      ),
                                                    ))),
                                          )
                                        ])))
                          ],
                        ),
                      )),
                ),
              ]),
            ]))));
  }
}
