import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mamashay/dashboard/_widgets/products/_popup.dart';

class Product extends StatelessWidget {
  // final String ImageUrl;
  // final String name;

  // Product({required this.ImageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.fromLTRB(5, 20, 10, 10),
          child: Container(
              width: 150,
              height: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(107, 123, 66, 0.06),
              ),
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(children: [
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
                        Text(
                          textAlign: TextAlign.center,
                          'Fredo Miller',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(47, 53, 33, 0.6)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.asset(
                          'assets/chicken.png',
                          width: 2 * 70,
                          height: 2 * 40,
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        'Jollof Rice & Chicken',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(107, 123, 66, 1))),
                    Container(
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Row(
                            children: [
                              Container(
                                  // decoration: BoxDecoration(border: Border),
                                  child: Text(
                                textAlign: TextAlign.center,
                                'Vegetable Salad',
                                style: TextStyle(
                                  color: Color.fromRGBO(153, 153, 153, 1),
                                  fontSize: 12,
                                ),
                              )),
                              SizedBox(
                                width: 7,
                              ),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(253, 193, 130, 1),
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  // decoration: BoxDecoration(border: Border),
                                  child: Text(
                                textAlign: TextAlign.center,
                                '4.5',
                                style: TextStyle(
                                  color: Color.fromRGBO(153, 153, 153, 1),
                                  fontSize: 12,
                                ),
                              )),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        // textAlign: TextAlign.left,
                        'N7000',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(102, 102, 102, 1)),
                      ),
                    ]),
                    SizedBox(
                        width: 200.0, // Set the width here
                        child: Material(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                          elevation: 3.0,
                          color: Color.fromRGBO(172, 194, 112,
                              1), // You can adjust the elevation as needed
                          child: ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (BuildContext context) {
                                      return FractionallySizedBox(
                                        heightFactor:
                                            0.75, // Half of the screen height
                                        child: PopUp(),
                                      );
                                    });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(172, 194, 112, 1),
                                shadowColor: Color.fromRGBO(172, 194, 112, 0),
                                padding: const EdgeInsets.fromLTRB(15, 5, 15,
                                    5), // Change the background color here
                              ),
                              child: Text(
                                'Buy',
                                style: TextStyle(color: Colors.white),
                              )),
                        ))
                  ])))),
    );
  }
}
