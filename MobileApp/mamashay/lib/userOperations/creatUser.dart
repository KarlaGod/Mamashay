import 'package:firebase_auth/firebase_auth.dart';

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
    print(
        "user created successfully................................................");
  } catch (e) {
    print('Error creating user: $e');
  }
}
