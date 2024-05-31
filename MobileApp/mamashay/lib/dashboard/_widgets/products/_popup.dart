import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopUp extends StatefulWidget {
  @override
  PopUpWidgetState createState() => PopUpWidgetState();
}

class PopUpWidgetState extends State<PopUp> {
  bool message = false;
  final ScrollController _scrollController = ScrollController();
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          // Content of the popup goes here
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.fromLTRB(
                    0, 15, 0, 0), // Add padding of 20.0 to all sides
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            15, 0, 10, 0), // Add padding of 20.0 to all sides
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/senior.png',
                                  width: 2 * 15,
                                  height: 2 * 15,
                                  fit: BoxFit.cover,
                                )),
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 10,
                                  0), // Add padding of 20.0 to all sides
                              child: Text(
                                'Emeka Jordan',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(77, 77, 77, 1)),
                              ),
                            ),
                          ],
                        )),
                  ],
                )),
            Container(
                // width: 00,
                // color: Colors.grey[200],
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                  Stack(
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, 15, 0, 0), // Add padding of 20.0 to all sides
                          child: Container(
                            height: 30,
                            width: 30,
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromRGBO(
                                    172, 194, 112, 1), // Border color
                                width: 1.0, // Border width
                              ),
                              borderRadius:
                                  BorderRadius.circular(32), // Border radius
                            ),
                            child: IconButton(
                                iconSize: 15,
                                // Adjust size as needed
                                icon: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  // Background color of the circle
                                  child: Image.asset(
                                    'assets/home.png',
                                    width:
                                        20, // Set width to cover the entire screen width
                                    height:
                                        19, // Set how the image should be inscribed into the box
                                    alignment: Alignment
                                        .bottomLeft, // Set the alignment of the image within its bounds
                                  ),
                                ),
                                onPressed: () {
                                  GoRouter.of(context).go('/dashboard');
                                }),
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 15, 15, 0), // Add padding of 20.0 to all sides
                      child: Container(
                        height: 30,
                        width: 30,
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(
                                172, 194, 112, 1), // Border color
                            width: 1.0, // Border width
                          ),
                          borderRadius:
                              BorderRadius.circular(32), // Border radius
                        ),
                        child: IconButton(
                            iconSize: 15,
                            // Adjust size as needed
                            icon: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              // Background color of the circle
                              child: Image.asset(
                                'assets/share.png',
                                width:
                                    15, // Set width to cover the entire screen width
                                height:
                                    25, // Set how the image should be inscribed into the box
                                alignment: Alignment
                                    .bottomLeft, // Set the alignment of the image within its bounds
                              ),
                            ),
                            onPressed: () {
                              GoRouter.of(context).go('/dashboard');
                            }),
                      )),
                ]))
          ]),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: AspectRatio(
              aspectRatio: 16 / 10,
              // Define your aspect ratio
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      15.0), // Optional: Add border radius
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/chicken.png'), // Replace 'your_image.jpg' with your image asset
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 150.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            // textAlign: TextAlign.left,
                            'N17,000.00',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(107, 123, 66, 0.8)),
                          ),
                          // Container(
                          //     // decoration: BoxDecoration(border: Border),
                          //     child: Text(
                          //   textAlign: TextAlign.center,
                          //   'Vegetable Salad',
                          //   style: TextStyle(
                          //     color: Color.fromRGBO(153, 153, 153, 1),
                          //     fontSize: 12,
                          //   ),
                          // ))
                        ])),
                Container(
                  width: 130.0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            // decoration: BoxDecoration(border: Border),
                            child: Text(
                          textAlign: TextAlign.center,
                          'Rating:',
                          style: TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1),
                            fontSize: 15,
                          ),
                        )),
                        SizedBox(
                          width: 3,
                        ),
                        Image.asset(
                          'assets/star.png',
                          width:
                              15, // Set width to cover the entire screen width
                          height:
                              15, // Set how the image should be inscribed into the box
                          alignment: Alignment
                              .bottomLeft, // Set the alignment of the image within its bounds
                        ),
                        Image.asset(
                          'assets/star.png',
                          width:
                              15, // Set width to cover the entire screen width
                          height:
                              15, // Set how the image should be inscribed into the box
                          alignment: Alignment
                              .bottomLeft, // Set the alignment of the image within its bounds
                        ),
                        Image.asset(
                          'assets/star.png',
                          width:
                              15, // Set width to cover the entire screen width
                          height:
                              15, // Set how the image should be inscribed into the box
                          alignment: Alignment
                              .bottomLeft, // Set the alignment of the image within its bounds
                        ),
                        Image.asset(
                          'assets/star.png',
                          width:
                              15, // Set width to cover the entire screen width
                          height:
                              15, // Set how the image should be inscribed into the box
                          alignment: Alignment
                              .bottomLeft, // Set the alignment of the image within its bounds
                        ),
                        Image.asset(
                          'assets/half_star.png',
                          width:
                              15, // Set width to cover the entire screen width
                          height:
                              15, // Set how the image should be inscribed into the box
                          alignment: Alignment
                              .bottomLeft, // Set the alignment of the image within its bounds
                        ),
                      ]),
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  // textAlign: TextAlign.left,
                  'Homemade Goat Meat Pepper Soup, White \nRice, Snail Stew, Fresh Veggies Included. \nFor Breakfast, Lunch Or Dinner...',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(102, 102, 102, 1)),
                ),
              ])),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/bonus.png',
                  width: 50, // Set width to cover the entire screen width
                  height:
                      20, // Set how the image should be inscribed into the box
                  alignment: Alignment
                      .bottomLeft, // Set the alignment of the image within its bounds
                ),
                Container(
                    // decoration: BoxDecoration(border: Border),
                    child: Text(
                  textAlign: TextAlign.center,
                  '1 Can Cocacola, 2 Orange Fruits, Takeaway...',
                  style: TextStyle(
                    color: Color.fromRGBO(153, 153, 153, 1),
                    fontSize: 15,
                  ),
                )),
                SizedBox(
                  width: 3,
                ),
              ],
            ),
          ),

          Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Container(
                  child: SingleChildScrollView(
                      scrollDirection:
                          Axis.horizontal, // Set scroll direction to horizontal
                      child: Row(children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 210,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color.fromRGBO(107, 123, 66, 0.06),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          iconSize: 15, // Adjust size as needed
                                          icon: Image.asset(
                                            'assets/location.png',
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
                                        'Rumudara Port Hacourt',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(107, 123, 66, 1),
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                width: 210,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color.fromRGBO(107, 123, 66, 0.06),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          iconSize: 15, // Adjust size as needed
                                          icon: Image.asset(
                                            'assets/call.png',
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
                                        '+234 123 456 7890',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(107, 123, 66, 1),
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            SizedBox(
                              width: 7,
                            ),
                            Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color.fromRGBO(107, 123, 66, 0.06),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          iconSize: 15, // Adjust size as needed
                                          icon: Image.asset(
                                            'assets/calandar.png',
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
                                        'Calandar',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(107, 123, 66, 1),
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ))

                            // Add more widgets as needed
                          ],
                        ),
                      ])))),
          SizedBox(
            height: 20,
          ),
          message == false
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Center(
                      child: Container(
                          // width: 400,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                        ClipRRect(
                            // borderRadius: BorderRadius.circular(0),
                            child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                // Adjust the radius as per your requirement
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(172, 194, 112, 1),
                            ), // Background color
                            padding:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return EdgeInsets.symmetric(
                                    vertical: 13.0,
                                    horizontal: 8.0); // Padding when pressed
                              }
                              return EdgeInsets.symmetric(
                                  vertical: 13.0,
                                  horizontal: 8.0); // Default padding
                            }),
                          ),
                          // ElevatedButton.styleFrom(
                          //   backgroundColor: Color.fromRGBO(172, 194, 112, 1),
                          //   padding: const EdgeInsets.fromLTRB(100, 20, 100,
                          //       20), // Change the background color here
                          // ),
                          child: Image.asset(
                            'assets/love.png',
                            width:
                                30, // Set width to cover the entire screen width
                            height:
                                25, // Set how the image should be inscribed into the box
                            alignment: Alignment
                                .bottomLeft, // Set the alignment of the image within its bounds
                          ),
                        )),
                        ClipRRect(
                            // borderRadius: BorderRadius.circular(0),
                            child: ElevatedButton(
                          onPressed: () {
                            _message(true);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                // Adjust the radius as per your requirement
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(172, 194, 112, 1),
                            ), // Background color
                            padding:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return EdgeInsets.symmetric(
                                    vertical: 16.0,
                                    horizontal: 100.0); // Padding when pressed
                              }
                              return EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 100.0); // Default padding
                            }),
                          ),
                          // ElevatedButton.styleFrom(
                          //   backgroundColor: Color.fromRGBO(172, 194, 112, 1),
                          //   padding: const EdgeInsets.fromLTRB(100, 20, 100,
                          //       20), // Change the background color here
                          // ),
                          child: Text(
                            'Message',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                      ]))))
              : Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(107, 123, 66, 0.06),
                  ),
                  height: 80,
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Column(children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          padding: EdgeInsets.all(0),
                          child: Row(
                            children: [
                              IconButton(
                                  iconSize: 20,
                                  padding: EdgeInsets.all(
                                      4), // Adjust size as needed
                                  icon: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Color.fromRGBO(53, 54, 51,
                                        0.098), // Background color of the circle
                                    child: Icon(
                                      Icons.add,
                                      color: Color.fromRGBO(107, 123, 66, 1),
                                      size: 15,
                                    ),
                                  ),
                                  onPressed: () {}),

                              SizedBox(
                                  width: 8), // Adding spacing between icons
                              Expanded(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  // padding: EdgeInsets.all(8),
                                  child: TextFormField(
                                    controller: _controller,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 3, 10, 0),
                                      hintText: 'Type messages here...',
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintStyle: TextStyle(
                                        color: Color.fromRGBO(
                                            0, 0, 0, 0.2), // Placeholder text
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      // Border style
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      8), // Adding spacing between TextFormField and IconButton
                              IconButton(
                                  iconSize: 15, // Adjust size as needed
                                  icon: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors
                                        .white, // Background color of the circle
                                    child: Image.asset(
                                      'assets/image.png',
                                      width:
                                          25, // Set width to cover the entire screen width
                                      height:
                                          25, // Set how the image should be inscribed into the box
                                      alignment: Alignment
                                          .bottomLeft, // Set the alignment of the image within its bounds
                                    ),
                                  ),
                                  onPressed: () {
                                    GoRouter.of(context).go('/settings');
                                  }),
                            ],
                          ),
                        )),
                        IconButton(
                            iconSize: 40,
                            padding: EdgeInsets.all(4), // Adjust size as needed
                            icon: CircleAvatar(
                              radius: 20,
                              backgroundColor: Color.fromRGBO(172, 194, 112,
                                  1), // Background color of the circle
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                            onPressed: () {}),
                      ],
                    ),
                  ])),
        ]));
  }

  void _message(bool value) {
    setState(() {
      message = value;
    });
  }

  void sendMessage(String message) {
    setState(() {});
  }
}