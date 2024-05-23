import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mamashay/dashboard/_widgets/products/_popup.dart';

class ProductView extends StatelessWidget {
  // final String ImageUrl;
  // final String name;

  // Product({required this.ImageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Container(
              width: 150,
              height: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 7, 10, 5),
                  child: Column(children: [
                    Row(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Image.asset(
                            'assets/chicken.png',
                            width: 2 * 65,
                            height: 2 * 55,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'assets/man.png',
                                    width: 2 * 10,
                                    height: 2 * 10,
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border.symmetric(
                                          vertical: BorderSide(
                                              color: Color.fromRGBO(
                                                  204, 204, 204, 1)))),
                                  child: Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'Fredo Miller',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: Color.fromRGBO(
                                                47, 53, 33, 0.6)),
                                      ))),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/star.png',
                                        width:
                                            10, // Set width to cover the entire screen width
                                        height:
                                            10, // Set how the image should be inscribed into the box
                                        alignment: Alignment
                                            .bottomLeft, // Set the alignment of the image within its bounds
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Container(
                                          // decoration: BoxDecoration(border: Border),
                                          child: Text(
                                        textAlign: TextAlign.center,
                                        '4.5',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(153, 153, 153, 1),
                                          fontSize: 15,
                                        ),
                                      )),
                                    ]),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              width: 180,
                              child: Text(
                                  textAlign: TextAlign.left,
                                  'Goat Meat Jollof Rice, Carrot And Vegetable Ganishing',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(107, 123, 66, 1)))),
                          SizedBox(
                            height: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/bonus.png',
                                  width:
                                      45, // Set width to cover the entire screen width
                                  height:
                                      15, // Set how the image should be inscribed into the box
                                  alignment: Alignment
                                      .bottomLeft, // Set the alignment of the image within its bounds
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    // decoration: BoxDecoration(border: Border),
                                    child: Text(
                                  textAlign: TextAlign.center,
                                  '1 Can Cocacola',
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
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  // textAlign: TextAlign.left,
                                  'N7000',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(107, 123, 66, 0.8)),
                                ),
                              ]),
                        ],
                      )
                    ])
                  ])))),
    );
  }
}
