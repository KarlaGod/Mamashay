import 'package:flutter/material.dart';
import './screen.dart'; // Import your main screen
import 'package:go_router/go_router.dart';
import './sign_in/sign_in.dart';
import './sign_in/get_started.dart';
void main() {
  runApp(MyApp());
}

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
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
    
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mamashay',
      routerConfig: router,
      );
  }
}