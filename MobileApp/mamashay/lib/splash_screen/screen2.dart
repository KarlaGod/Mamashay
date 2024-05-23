import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Message {
  final String text;
  final bool isMe;

  Message(this.text, this.isMe);
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: null,
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(107, 123, 66, 0.1),
                  image: DecorationImage(
                    image: AssetImage('assets/Splash_screen.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    // textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(15, 15, 15, 2),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 7,
                                        height: 7,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(172, 194, 112, 1),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                              172, 194, 112, 0.2),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                              172, 194, 112, 0.2),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                              172, 194, 112, 0.2),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                              172, 194, 112, 0.2),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 0, 0),
                                          child: Text(
                                            'Search For & Purchase Homemade Products',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    107, 123, 66, 1),
                                                fontSize: 23,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )),
                                      ])),
                              SizedBox(
                                height: 5.0,
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                  child: Text(
                                    'You can quickly find an item on this app by using the search function to locate any item of your choice from multiple search results.',
                                    style: TextStyle(
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  )),
                              SizedBox(
                                height: 2,
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                  child: Text(
                                    'It gets even more interesting when you utilize the filters to get lazer focused results...',
                                    style: TextStyle(
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  )),
                              SizedBox(height: 15),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                  child: Center(
                                      child: Container(
                                          // width: 400,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                        ClipRRect(
                                            // borderRadius: BorderRadius.circular(0),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  GoRouter.of(context)
                                                      .go('/screen1');
                                                },
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      // Adjust the radius as per your requirement
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      MaterialStateProperty
                                                          .all<Color>(Colors
                                                              .white), // Background color
                                                  padding: MaterialStateProperty
                                                      .resolveWith((states) {
                                                    if (states.contains(
                                                        MaterialState
                                                            .pressed)) {
                                                      return EdgeInsets.symmetric(
                                                          vertical: 10.0,
                                                          horizontal:
                                                              30.0); // Padding when pressed
                                                    }
                                                    return EdgeInsets.symmetric(
                                                        vertical: 10.0,
                                                        horizontal:
                                                            30.0); // Default padding
                                                  }),
                                                ),
                                                // ElevatedButton.styleFrom(
                                                //   backgroundColor: Color.fromRGBO(172, 194, 112, 1),
                                                //   padding: const EdgeInsets.fromLTRB(100, 20, 100,
                                                //       20), // Change the background color here
                                                // ),
                                                child: Row(children: [
                                                  Image.asset(
                                                    'assets/splash_arrow_back.png',
                                                    width: 2 * 7,
                                                    height: 2 * 9,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Back',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            107, 123, 66, 1),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ]))),
                                        ClipRRect(
                                            // borderRadius: BorderRadius.circular(0),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  GoRouter.of(context)
                                                      .go('/screen3');
                                                },
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      // Adjust the radius as per your requirement
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(
                                                    Color.fromRGBO(
                                                        172, 194, 112, 1),
                                                  ), // Background color
                                                  padding: MaterialStateProperty
                                                      .resolveWith((states) {
                                                    if (states.contains(
                                                        MaterialState
                                                            .pressed)) {
                                                      return EdgeInsets.symmetric(
                                                          vertical: 10.0,
                                                          horizontal:
                                                              30.0); // Padding when pressed
                                                    }
                                                    return EdgeInsets.symmetric(
                                                        vertical: 10.0,
                                                        horizontal:
                                                            30.0); // Default padding
                                                  }),
                                                ),
                                                // ElevatedButton.styleFrom(
                                                //   backgroundColor: Color.fromRGBO(172, 194, 112, 1),
                                                //   padding: const EdgeInsets.fromLTRB(100, 20, 100,
                                                //       20), // Change the background color here
                                                // ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Next',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Image.asset(
                                                      'assets/splash_arrow.png',
                                                      width: 2 * 7,
                                                      height: 2 * 9,
                                                    ),
                                                  ],
                                                ))),
                                      ]))))
                            ],
                          ))
                    ]))));
  }
}
