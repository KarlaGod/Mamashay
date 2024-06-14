import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addChat(String userId1, String userId2, String message) async {
    // Create a new chat document with a unique ID
    DocumentReference chatRef = _firestore.collection('chats').doc();

    // Add chat data
    await chatRef.set({
      'user1': userId1,
      'user2': userId2,
      'createdAt': FieldValue.serverTimestamp(),
    });

    // Add an initial message (optional)
    await chatRef.collection('messages').add({
      'senderId': userId1,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });

    print(
        'Chat between $userId1 and $userId2 has been created.........................................');
  }

  Future<String> getMessagesAsStringSync(
      FirebaseFirestore firestore, String currentChatId) async {
    String messagesString = '';

    try {
      // Fetch messages asynchronously and await the result
      QuerySnapshot<Map<String, dynamic>> messagesSnapshot = await firestore
          .collection('chats')
          .doc(currentChatId)
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .get();

      // Process the fetched messages
      for (QueryDocumentSnapshot<Map<String, dynamic>> message
          in messagesSnapshot.docs) {
        Map<String, dynamic> data = message.data();
        String text = data['message'] ?? '';
        messagesString += text;
        print("message:");
        print(messagesString); // Add message text to the string
      }

      // Return the concatenated messages
      return messagesString;
    } catch (e) {
      // Handle any errors that occur during the process
      print('Error fetching messages: $e');
      // Return an empty string or handle the error according to your requirements
      return '';
    }
  }

  Future<List<Map<String, dynamic>>> getChats(
      String userId1, String userId2) async {
    List<Map<String, dynamic>> chats = [];

    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('chats')
          .where('user1', isEqualTo: userId1)
          .where('user2', isEqualTo: userId2)
          .get();

      for (var doc in querySnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>?;
        if (data != null) {
          var holder = getMessagesAsStringSync(_firestore, doc.id)
              .then((messagesString) {
            // Now you can use the messagesString
            data['id'] = doc.id;
            data['message'] = messagesString; // Add document ID to the data
            chats.add(data);
            chats.sort((a, b) => b['createdAt'].compareTo(a['createdAt']));
          });

          print("\n\n\n\n\n\n\n");
          print(data);
          print("\n\n\n\n\n\n\n");
        }
      }

      QuerySnapshot reverseQuerySnapshot = await _firestore
          .collection('chats')
          .where('user1', isEqualTo: userId2)
          .where('user2', isEqualTo: userId1)
          .get();

      for (var doc in reverseQuerySnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>?;
        if (data != null) {
          var holder = getMessagesAsStringSync(_firestore, doc.id)
              .then((messagesString) {
            // Now you can use the messagesString
            data['id'] = doc.id;
            data['message'] = messagesString; // Add document ID to the data
            chats.add(data);
            chats.sort((a, b) => b['createdAt'].compareTo(a['createdAt']));
          });
        }
      }
      print(
          'Chat between $userId1 and $userId2 has been fetched.........................................');
      print("\n\n\n\n\n\n\n");
      print("\n\n\n\n\n\n\n");
      print(chats);
      print("\n\n\n\n\n\n\n");
      print("\n\n\n\n\n\n\n");
    } catch (e) {
      print('Error fetching chats: $e');
    }

    return chats; // Ensure that chats is always returned
  }

  Stream<QuerySnapshot> getMessages(String chatId) {
    Stream<QuerySnapshot<Map<String, dynamic>>> value = _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
    print("value........................................");
    print(value);
    return value;
  }

  Stream<QuerySnapshot> getMainMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}
