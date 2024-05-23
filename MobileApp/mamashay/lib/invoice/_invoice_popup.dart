import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class InvoicePopUp extends StatefulWidget {
  @override
  PopUpWidgetState createState() => PopUpWidgetState();
}

class PopUpWidgetState extends State<InvoicePopUp> {
  bool message = false;
  final ScrollController _scrollController = ScrollController();
  TextEditingController _controller = TextEditingController();

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
          Container(
              height: 110,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/invoice_frame.png'), // Replace with your image path
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/Generate_Invoice.png",
                      height: 20,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 35,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "#1234567890",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            // width: 200,
                            height: 20,
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.5),
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "01 Sept 2022 - 01:23pm",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.5),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Container(
                // width: 200,
                height: 150,

                decoration: BoxDecoration(
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
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Center(
                  child: Container(
                      // width: 400,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                    ClipRRect(
                        // borderRadius: BorderRadius.circular(0),
                        child: ElevatedButton(
                            onPressed: () {
                              GoRouter.of(context).go('/screen4');
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  // Adjust the radius as per your requirement
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white), // Background color
                              padding:
                                  MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 30.0); // Padding when pressed
                                }
                                return EdgeInsets.symmetric(
                                    vertical: 10.0,
                                    horizontal: 30.0); // Default padding
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
                                    color: Color.fromRGBO(107, 123, 66, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ]))),
                    ClipRRect(
                        // borderRadius: BorderRadius.circular(0),
                        child: ElevatedButton(
                            onPressed: () {
                              GoRouter.of(context).go('/screen6');
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
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
                                      vertical: 10.0,
                                      horizontal: 30.0); // Padding when pressed
                                }
                                return EdgeInsets.symmetric(
                                    vertical: 10.0,
                                    horizontal: 30.0); // Default padding
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
                                      fontWeight: FontWeight.w600),
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
                  ])))),
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
