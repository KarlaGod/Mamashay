import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getUsers() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection('users').get();
      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;

        return data;
      }).toList();
    } catch (e) {
      print('Error getting users: $e');
      throw e;
    }
  }

  Future<Map<String, dynamic>?> getUserById(String userId) async {
    try {
      // Fetch the document with the specified userId from the 'users' collection
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      // Check if the document exists
      if (docSnapshot.exists) {
        // Get the document data and add the document ID to the map
        final data = await docSnapshot.data() as Map<String, dynamic>;
        print(data);
        data['id'] = docSnapshot.id;
        return data;
      } else {
        // Return null if the document does not exist
        print(
            "user does not exist..............................................................");

        return null;
      }
    } catch (e) {
      // Log the error for debugging purposes
      print('Error getting user by ID: $e');
      // Rethrow the error to allow it to be handled further up the call stack if necessary
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection('products').get();
      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        return data;
      }).toList();
    } catch (e) {
      print('Error getting users: $e');
      throw e;
    }
  }
}


//https://www.google.com/url?sa=i&url=https%3A%2F%2Fopensauce.vendease.com%2Fculture%2Fthe-yassification-of-amala-by-upscale-restaurants-is-ruining-its-authenticity%2F&psig=AOvVaw2XPHI7jMJdM4uHXwCk6J_5&ust=1719141357893000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMCmpeKK74YDFQAAAAAdAAAAABAE
