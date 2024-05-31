import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter_login/twitter_login.dart';

class TwitterSignInProvider {
  final TwitterLogin _twitterLogin = TwitterLogin(
    apiKey: '2YpsyXBw4J4CD57laFI72k2w8',
    apiSecretKey: 'PmrQXWiq3RWefV8kIDLDEe1cvvLfYXPrzDSe549X5WYvaICzb5',
    redirectURI: 'myapp://dashboard', // Custom URL scheme
  );

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithTwitter(BuildContext context) async {
    try {
      final authResult = await _twitterLogin.login();

      if (authResult.status == TwitterLoginStatus.loggedIn) {
        final AuthCredential credential = TwitterAuthProvider.credential(
          accessToken: authResult.authToken!,
          secret: authResult.authTokenSecret!,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        return userCredential.user;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Twitter login cancelled or failed')),
        );
        return null;
      }
    } catch (e) {
      print('Error during Twitter login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during Twitter login: $e')),
      );

      return null;
    }
  }
}
