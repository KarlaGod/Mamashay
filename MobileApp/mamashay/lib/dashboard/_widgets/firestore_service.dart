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
