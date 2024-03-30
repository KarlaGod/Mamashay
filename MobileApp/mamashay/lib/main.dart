import 'package:flutter/material.dart';
import './screen.dart'; // Import your main screen
import 'package:go_router/go_router.dart';
import './sign_in/sign_in.dart';
import './sign_in/get_started.dart';
import 'SignUp/SignUp.dart';

void main() {
  runApp(MyApp());
}

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return SplashScreen();
      },
    ),
    GoRoute(
      path: '/getStarted',
      builder: (context, state) {
        return GetStartedScreen();
      },
    ),
    GoRoute(
      path: '/signIn',
      builder: (context, state) {
        return SignIn();
      },
    ),
    GoRoute(
      path: '/SignUp',
      builder: (context, state) {
        return SignUp();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mamashay',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
