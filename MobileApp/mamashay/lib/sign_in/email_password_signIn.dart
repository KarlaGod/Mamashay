import 'package:firebase_auth/firebase_auth.dart';

Future<User?> signInWithEmailPassword(String email, String password) async {
  try {
    // Sign in the user with email and password
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Return the signed-in user
    return userCredential.user;
  } catch (e) {
    // Handle any errors that occur during the sign-in process
    print('Failed to sign in with email and password: $e');
    return null; // Return null if sign-in fails
  }
}
