import 'package:flutter/material.dart';
import './screen.dart'; // Import your main screen
import 'package:go_router/go_router.dart';
import './sign_in/sign_in.dart';
import './sign_in/get_started.dart';
import 'SignUp/SignUp.dart';
import './dashboard/main.dart';
import './dashboard/_widgets/settings/settings.dart';
import 'notifications/notifications.dart';
import './chat/chat_notifications.dart';
import './chat/chat.dart';
import './test/test.dart';

void main() {
  runApp(MyApp());
}

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/test',
      builder: (context, state) {
        return MyHomePage();
      },
    ),
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
    GoRoute(
      path: '/dashboard',
      builder: (context, state) {
        return Dashboard();
      },
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) {
        return Settings();
      },
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) {
        return Notifications();
      },
    ),
    GoRoute(
      path: '/chat_notifications',
      builder: (context, state) {
        return ChatNotifications();
      },
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) {
        return Chat();
      },
    )
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
