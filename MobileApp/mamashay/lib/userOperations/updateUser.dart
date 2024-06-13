import 'package:firebase_auth/firebase_auth.dart';

Future<void> updateUserProfile({String? displayName, String? photoURL}) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      if (displayName != null) {
        await user.updateDisplayName(displayName);
      }
      if (photoURL != null) {
        await user.updatePhotoURL(photoURL);
      }
    } else {
      print('No user signed in');
    }
  } catch (e) {
    print('Error updating user profile: $e');
  }
}
