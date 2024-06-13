import 'package:firebase_auth/firebase_auth.dart';

Future<User?> getCurrentUser() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  } catch (e) {
    print('Error getting current user: $e');
    return null;
  }
}
