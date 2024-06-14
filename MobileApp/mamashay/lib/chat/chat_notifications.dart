import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '_widgets/chat_notificationDiv.dart';
import './chatModel.dart';

class ChatNotifications extends StatefulWidget {
  final String userId;

  ChatNotifications({required this.userId});

  @override
  _ChatNotificationState createState() => _ChatNotificationState();
}

class _ChatNotificationState extends State<ChatNotifications> {
  List<Chats> chatList = [];

  @override
  void initState() {
    super.initState();
    fetchChats();
  }

  Future<void> fetchChats() async {
    try {
      // Fetch chat threads where the current user is involved
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('chats')
          .where('participants', arrayContains: widget.userId)
          .orderBy('timestamp', descending: true)
          .get();

      // Convert documents to Chat objects
      List<Chats> chats = snapshot.docs.map((doc) {
        return Chats.fromDocument(doc);
      }).toList();

      // Update the chatList with fetched chats
      setState(() {
        chatList = chats;
      });
    } catch (e) {
      print('Error fetching chats: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(107, 123, 66, 0.06),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Image.asset(
                                  'assets/arrow.png',
                                  width: 16,
                                  height: 16,
                                ),
                                onPressed: () {
                                  GoRouter.of(context).go('/dashboard');
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: Text(
                                  'Chat',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(107, 123, 66, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                    child: IconButton(
                                      iconSize: 15,
                                      icon: CircleAvatar(
                                        radius: 20,
                                        backgroundColor:
                                            Color.fromRGBO(107, 123, 66, 0.1),
                                        child: Image.asset(
                                          'assets/message.png',
                                          width: 17,
                                          height: 15,
                                          alignment: Alignment.bottomLeft,
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Positioned(
                                    right: 7,
                                    top: 60,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(253, 193, 130, 1),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                    child: IconButton(
                                      iconSize: 15,
                                      icon: CircleAvatar(
                                        radius: 20,
                                        backgroundColor:
                                            Color.fromRGBO(107, 123, 66, 0.1),
                                        child: Image.asset(
                                          'assets/notification.png',
                                          width: 15,
                                          height: 19,
                                          alignment: Alignment.bottomLeft,
                                        ),
                                      ),
                                      onPressed: () {
                                        GoRouter.of(context)
                                            .go('/notifications');
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    right: 7,
                                    top: 60,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(253, 193, 130, 1),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: IconButton(
                                  iconSize: 15,
                                  icon: CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        Color.fromRGBO(107, 123, 66, 0.1),
                                    child: Image.asset(
                                      'assets/dots.png',
                                      width: 6,
                                      height: 17,
                                      alignment: Alignment.bottomLeft,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: null,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
                            child: TextFormField(
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                hintText:
                                    'Search for food or any organic product...',
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.2)),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ...chatList
                  .map((chat) => ChatNotificationDiv(
                        ImageUrl: 'assets/senior.png',
                        messager: chat.otherUserId,
                        time: chat.timestamp.toDate().toString(),
                        details: chat.lastMessage,
                        chatId: chat.chatId,
                        userId: widget.userId,
                        otherUserId: chat.otherUserId,
                      ))
                  .toList(),
              ChatNotificationDiv(
                ImageUrl: 'assets/senior.png',
                messager: "",
                time: "8:00 pm",
                details: "",
                chatId: '0',
                userId: widget.userId,
                otherUserId: '0',
              )
            ],
          ),
        ),
      ),
    );
  }
}
