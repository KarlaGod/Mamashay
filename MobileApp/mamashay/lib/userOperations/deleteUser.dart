import 'package:firebase_auth/firebase_auth.dart';

Future<void> deleteUser() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.delete();
    } else {
      print('No user signed in');
    }
  } catch (e) {
    print('Error deleting user: $e');
  }
}
