import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Screen1 extends StatelessWidget {
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
                  // image: DecorationImage(
                  //   image: AssetImage('assets/Splash_screen.png'),
                  //   fit: BoxFit.cover,
                  // ),
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
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 0, 0),
                                          child: RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.3),
                                                fontSize: 16,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'This App Packs ',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          102, 102, 102, 1),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                TextSpan(
                                                  text: ' Amazing Features ',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          102, 102, 102, 1),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                TextSpan(
                                                  text: 'Would You Like To ',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          102, 102, 102, 1),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                TextSpan(
                                                  text: 'Explore?',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          172, 194, 112, 1),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),

                                            // overflow: TextOverflow.ellipsis,
                                          ),
                                        )),
                                      ])),
                              SizedBox(height: 50),
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
                                                .go('/AuthenticateSlideView');
                                          },
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                // Adjust the radius as per your requirement
                                              ),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              Color.fromRGBO(242, 242, 242, 1),
                                            ), // Background color
                                            padding: MaterialStateProperty
                                                .resolveWith((states) {
                                              if (states.contains(
                                                  MaterialState.pressed)) {
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
                                          child: Text(
                                            'Skip',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    107, 123, 66, 1),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )),
                                        ClipRRect(
                                            // borderRadius: BorderRadius.circular(0),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  GoRouter.of(context)
                                                      .go('/SlideView');
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
                                                      'Explore Features',
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
