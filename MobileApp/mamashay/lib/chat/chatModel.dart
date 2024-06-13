import 'package:cloud_firestore/cloud_firestore.dart';

class Chats {
  final String chatId;
  final String userId;
  final String otherUserId;
  final String lastMessage;
  final Timestamp timestamp;

  Chats({
    required this.chatId,
    required this.userId,
    required this.otherUserId,
    required this.lastMessage,
    required this.timestamp,
  });

  factory Chats.fromDocument(DocumentSnapshot doc) {
    return Chats(
      chatId: doc.id,
      userId: doc['userId'],
      otherUserId: doc['otherUserId'],
      lastMessage: doc['lastMessage'],
      timestamp: doc['timestamp'],
    );
  }
}
