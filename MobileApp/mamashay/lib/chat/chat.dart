import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '_widgets/bio.dart';
import '../invoice/_invoice_popup.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../review/_review/_review_buttom_sheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import './chatModel.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  final String userId;
  final String otherUserId;

  ChatScreen({
    required this.chatId,
    required this.userId,
    required this.otherUserId,
  });

  @override
  ChatWidgetState createState() => ChatWidgetState();
}

class ChatWidgetState extends State<ChatScreen> {
  final User? _user = FirebaseAuth.instance.currentUser;

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

  void _showSlideTransitionDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Color.fromRGBO(0, 0, 0, 0.5),
      transitionDuration: Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 90),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(children: [
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 85,
                    height: 100,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    // color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/attachment.png",
                              height: 70,
                              width: 70,
                            )),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (BuildContext context) {
                                    return FractionallySizedBox(
                                      heightFactor:
                                          0.75, // Half of the screen height
                                      child: ReviewPopUp(),
                                    );
                                  });
                            },
                            icon: Image.asset(
                              "assets/feedback.png",
                              height: 70,
                              width: 70,
                            )),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (BuildContext context) {
                                    return FractionallySizedBox(
                                      heightFactor:
                                          0.75, // Half of the screen height
                                      child: InvoicePopUp(),
                                    );
                                  });
                            },
                            icon: Image.asset(
                              "assets/invoice.png",
                              height: 70,
                              width: 70,
                            ))
                      ],
                    ),
                  ),
                ])));
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 1),
            end: Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  void _menuSlideTransitionDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Color.fromRGBO(0, 0, 0, 0.2),
      transitionDuration: Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 12, 0),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                  width: 150,
                  height: 220,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  // color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/share_.png",
                                  height: 18,
                                  width: 60,
                                )),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.symmetric(
                                        horizontal: BorderSide(
                                            color: Color.fromRGBO(
                                                204, 204, 204, 0.3)))),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/vendor_profile.png",
                                      height: 20,
                                      width: 100,
                                    ))),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/block_vendor.png",
                                  height: 20,
                                  width: 100,
                                )),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.symmetric(
                                        horizontal: BorderSide(
                                            color: Color.fromRGBO(
                                                204, 204, 204, 0.3)))),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/delete_chat.png",
                                      height: 20,
                                      width: 100,
                                    ))),
                          ],
                        ),
                      ])),
            ));
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 0),
            end: Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                  image: DecorationImage(
                    image: AssetImage('assets/Chat_background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(107, 123, 66, 0.06),
                        ),
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
                                            GoRouter.of(context)
                                                .go('/dashboard');
                                          },
                                        ),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                15,
                                                0), // Add padding of 20.0 to all sides
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Image.asset(
                                                      'assets/senior.png',
                                                      width: 2 * 15,
                                                      height: 2 * 15,
                                                      fit: BoxFit.cover,
                                                    )),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(
                                                          8,
                                                          0,
                                                          10,
                                                          0), // Add padding of 20.0 to all sides
                                                      child: Text(
                                                        'Emeka Jordan',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Color.fromRGBO(
                                                                    77,
                                                                    77,
                                                                    77,
                                                                    1)),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(
                                                          8,
                                                          0,
                                                          0,
                                                          0), // Add padding of 20.0 to all sides
                                                      child: Text(
                                                        'online',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Color.fromRGBO(
                                                                    172,
                                                                    194,
                                                                    112,
                                                                    1)),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )),
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
                                              padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  50,
                                                  0,
                                                  0), // Add padding of 20.0 to all sides
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                padding: EdgeInsets.all(0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color.fromRGBO(
                                                        172,
                                                        194,
                                                        112,
                                                        1), // Border color
                                                    width: 1.0, // Border width
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          32), // Border radius
                                                ),
                                                child: IconButton(
                                                    iconSize: 15,
                                                    // Adjust size as needed
                                                    icon: CircleAvatar(
                                                      radius: 20,
                                                      backgroundColor:
                                                          Colors.transparent,
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
                                                      GoRouter.of(context)
                                                          .go('/dashboard');
                                                    }),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0,
                                              50,
                                              10,
                                              0), // Add padding of 20.0 to all sides
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            padding: EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color.fromRGBO(172, 194,
                                                    112, 1), // Border color
                                                width: 1.0, // Border width
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      32), // Border radius
                                            ),
                                            child: IconButton(
                                                iconSize: 15,
                                                // Adjust size as needed
                                                icon: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  // Background color of the circle
                                                  child: Image.asset(
                                                    'assets/dots.png',
                                                    width:
                                                        5, // Set width to cover the entire screen width
                                                    height:
                                                        19, // Set how the image should be inscribed into the box
                                                    alignment: Alignment
                                                        .bottomLeft, // Set the alignment of the image within its bounds
                                                  ),
                                                ),
                                                onPressed: () {
                                                  _menuSlideTransitionDialog(
                                                      context);
                                                }),
                                          )),
                                    ]))
                              ]),
                          Padding(
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                              child: Container(
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis
                                          .horizontal, // Set scroll direction to horizontal
                                      child: Row(children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                width: 210,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                          iconSize:
                                                              15, // Adjust size as needed
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
                                                        textAlign:
                                                            TextAlign.center,
                                                        'Rumudara Port Hacourt',
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 0.3),
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
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                          iconSize:
                                                              15, // Adjust size as needed
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
                                                        textAlign:
                                                            TextAlign.center,
                                                        '+234 123 456 7890',
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 0.3),
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
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                          iconSize:
                                                              15, // Adjust size as needed
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
                                                        textAlign:
                                                            TextAlign.center,
                                                        'Calandar',
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 0.3),
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
                          DescriptionWidget(),
                        ])),
                    Expanded(
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('chats')
                            .doc(widget.chatId)
                            .collection('messages')
                            .orderBy('timestamp', descending: true)
                            .snapshots(),
                        builder:
                            (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
                          if (chatSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          final chatDocs = chatSnapshot.data?.docs;
                          return ListView.builder(
                            controller: _scrollController,
                            reverse: true,
                            itemCount: chatDocs?.length,
                            itemBuilder: (ctx, index) {
                              final messageData = chatDocs?[index].data()
                                  as Map<String, dynamic>;
                              final message = chatDocs![index];
                              return ListTile(
                                title: Align(
                                  alignment:
                                      message['senderId'] == widget.userId
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minWidth: 50,
                                      maxWidth: 200,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          message['senderId'] == widget.userId
                                              ? Color.fromRGBO(107, 123, 66, 1)
                                              : Colors.grey[200],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      message['text'],
                                      style: TextStyle(
                                        color:
                                            message['senderId'] == widget.userId
                                                ? Colors.white
                                                : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(107, 123, 66, 0.06),
                        ),
                        height: 90,
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
                                          backgroundColor: Color.fromRGBO(
                                              53,
                                              54,
                                              51,
                                              0.098), // Background color of the circle
                                          child: Icon(
                                            Icons.add,
                                            color:
                                                Color.fromRGBO(107, 123, 66, 1),
                                            size: 15,
                                          ),
                                        ),
                                        onPressed: () =>
                                            _showSlideTransitionDialog(
                                                context)),

                                    SizedBox(
                                        width:
                                            8), // Adding spacing between icons
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        // padding: EdgeInsets.all(8),
                                        child: TextFormField(
                                          controller: _controller,
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10, 3, 10, 0),
                                            hintText: 'Type messages here...',
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintStyle: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0,
                                                  0.2), // Placeholder text
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
                                          _pickImage();
                                        }),
                                  ],
                                ),
                              )),
                              IconButton(
                                  iconSize: 40,
                                  padding: EdgeInsets.all(
                                      4), // Adjust size as needed
                                  icon: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Color.fromRGBO(
                                        172,
                                        194,
                                        112,
                                        1), // Background color of the circle
                                    child: Icon(
                                      Icons.send,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                  onPressed: () {
                                    String enteredText = _controller.text;
                                    sendMessage(enteredText);
                                    _controller.clear();
                                  }),
                            ],
                          ),
                        ])),
                    SizedBox(width: 8),
                  ],
                ))));
  }

  void sendMessage(String message) {
    // FirebaseFirestore.instance.collection('chats').add({
    //   'text': _controller.text,
    //   'createdAt': Timestamp.now(),
    //   'userId': _user?.uid,
    //   'userName': _user?.email,
    // });

    if (_controller.text.isEmpty) return;

    FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.chatId)
        .collection('messages')
        .add({
      'text': _controller.text,
      'senderId': widget.userId,
      'timestamp': Timestamp.now(),
    });

    // Scroll to the end of the list after adding a new message
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
    setState(() {});
  }
}
