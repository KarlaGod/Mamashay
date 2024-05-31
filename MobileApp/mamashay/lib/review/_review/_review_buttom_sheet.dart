import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ReviewPopUp extends StatefulWidget {
  @override
  PopUpWidgetState createState() => PopUpWidgetState();
}

class PopUpWidgetState extends State<ReviewPopUp> {
  bool message = false;
  final ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _Controller = TextEditingController(); // Initialize controller in initState
  }

  @override
  void dispose() {
    _Controller.dispose();
    super.dispose();
  }

  void _handleSubmit(BuildContext context, String value) {
    print('Processing Data: $value');
    _Controller.clear();
    GoRouter.of(context).go('/dashboard');
  }

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
          color: Color.fromRGBO(233, 233, 233, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          // Content of the popup goes here
          Padding(
              padding: EdgeInsets.fromLTRB(
                  15, 15, 15, 0), // Add padding of 20.0 to all sides
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
                    width: 5.0,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Purchased Item',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(77, 77, 77, 1)),
                  ),
                ],
              )),

          Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Container(
                  // width: 200,
                  height: 130,
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
                                          'assets/add_product_icon.png'), // Replace 'your_image.jpg' with your image asset
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
              padding: EdgeInsets.fromLTRB(
                  15, 15, 15, 0), // Add padding of 20.0 to all sides
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
                    width: 5.0,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Add Photos',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(77, 77, 77, 1)),
                  ),
                ],
              )),

          Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Container(
                  // width: 200,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                            aspectRatio: 10 / 2,
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
                                          'assets/camera.png'), // Replace 'your_image.jpg' with your image asset
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
              padding: EdgeInsets.fromLTRB(
                  15, 15, 15, 0), // Add padding of 20.0 to all sides
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
                    width: 5.0,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Write Review',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(77, 77, 77, 1)),
                  ),
                ],
              )),

          Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Container(
                  // width: 200,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height:
                                100, // Set a fixed height for the TextFormField container
                            child: TextFormField(
                              controller: _Controller,
                              decoration: InputDecoration.collapsed(
                                hintText: "Tell us your experience...",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              maxLines: null,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value) {
                                _handleSubmit(
                                    context, value); // Call _handleSubmit here
                              },
                            ))
                      ],
                    ),
                  ))),
          // SizedBox(
          //   height: 30,
          // ),
          // Padding(
          //     padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          //     child: Center(
          //         child: Container(
          //             // width: 400,
          //             child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //           ClipRRect(
          //               // borderRadius: BorderRadius.circular(0),
          //               child: ElevatedButton(
          //                   onPressed: () {
          //                     GoRouter.of(context).go('/screen4');
          //                   },
          //                   style: ButtonStyle(
          //                     shape: MaterialStateProperty.all<
          //                         RoundedRectangleBorder>(
          //                       RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.circular(10.0),
          //                         // Adjust the radius as per your requirement
          //                       ),
          //                     ),
          //                     backgroundColor: MaterialStateProperty.all<Color>(
          //                         Colors.white), // Background color
          //                     padding:
          //                         MaterialStateProperty.resolveWith((states) {
          //                       if (states.contains(MaterialState.pressed)) {
          //                         return EdgeInsets.symmetric(
          //                             vertical: 12.0,
          //                             horizontal: 50.0); // Padding when pressed
          //                       }
          //                       return EdgeInsets.symmetric(
          //                           vertical: 12.0,
          //                           horizontal: 50.0); // Default padding
          //                     }),
          //                   ),
          //                   // ElevatedButton.styleFrom(
          //                   //   backgroundColor: Color.fromRGBO(172, 194, 112, 1),
          //                   //   padding: const EdgeInsets.fromLTRB(100, 20, 100,
          //                   //       20), // Change the background color here
          //                   // ),
          //                   child: Row(children: [
          //                     Text(
          //                       'Cancel',
          //                       style: TextStyle(
          //                           color: Color.fromRGBO(143, 143, 142, 1),
          //                           fontSize: 18,
          //                           fontWeight: FontWeight.w600),
          //                     ),
          //                   ]))),
          //           ClipRRect(
          //               // borderRadius: BorderRadius.circular(0),
          //               child: ElevatedButton(
          //                   onPressed: () {
          //                     GoRouter.of(context).go('/screen6');
          //                   },
          //                   style: ButtonStyle(
          //                     shape: MaterialStateProperty.all<
          //                         RoundedRectangleBorder>(
          //                       RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.circular(10.0),
          //                         // Adjust the radius as per your requirement
          //                       ),
          //                     ),
          //                     backgroundColor: MaterialStateProperty.all<Color>(
          //                       Color.fromRGBO(172, 194, 112, 1),
          //                     ), // Background color
          //                     padding:
          //                         MaterialStateProperty.resolveWith((states) {
          //                       if (states.contains(MaterialState.pressed)) {
          //                         return EdgeInsets.symmetric(
          //                             vertical: 12.0,
          //                             horizontal: 50.0); // Padding when pressed
          //                       }
          //                       return EdgeInsets.symmetric(
          //                           vertical: 12.0,
          //                           horizontal: 50.0); // Default padding
          //                     }),
          //                   ),
          //                   // ElevatedButton.styleFrom(
          //                   //   backgroundColor: Color.fromRGBO(172, 194, 112, 1),
          //                   //   padding: const EdgeInsets.fromLTRB(100, 20, 100,
          //                   //       20), // Change the background color here
          //                   // ),
          //                   child: Row(
          //                     children: [
          //                       Text(
          //                         'Submit',
          //                         style: TextStyle(
          //                             color: Colors.white,
          //                             fontSize: 18,
          //                             fontWeight: FontWeight.w600),
          //                       ),
          //                       SizedBox(
          //                         width: 5,
          //                       ),
          //                       Image.asset(
          //                         'assets/message_white.png',
          //                         width: 2 * 9,
          //                         height: 2 * 11,
          //                       ),
          //                     ],
          //                   ))),
          //         ])))),
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
