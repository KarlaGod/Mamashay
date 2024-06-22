import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> _saveUserData(User user) async {
  DocumentReference userRef = _firestore.collection('users').doc(user.uid);
  DocumentSnapshot userDoc = await userRef.get();
  if (!userDoc.exists) {
    await userRef.set({
      'name': user.displayName,
      'email': user.email,
      'profilePicture': user.photoURL,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}

Future<void> createUser({
  required String email,
  required String password,
  String? displayName,
  String? photoURL,
  String? phoneNumber,
}) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Access the newly created user
    User? user = userCredential.user;

    // Update additional user profile information if provided
    if (displayName != null) {
      await user?.updateDisplayName(displayName);
    }
    if (photoURL != null) {
      await user?.updatePhotoURL(photoURL);
    }
    if (phoneNumber != null) {
      // Example: Save phone number to Firestore or any other database
      // await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({'phoneNumber': phoneNumber});
    }
    _saveUserData(user!);
    print(
        "user created successfully................................................");
  } catch (e) {
    print('Error creating user: $e');
  }
}
