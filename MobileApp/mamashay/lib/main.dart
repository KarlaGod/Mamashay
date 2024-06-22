// import 'dart:ui_web';

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
import './splash_screen/screen1.dart';
import './splash_screen/screen2.dart';
import './splash_screen/screen3.dart';
import './splash_screen/screen4.dart';
import './splash_screen/screen5.dart';
import './splash_screen/screen6.dart';
import './orders/main.dart';
import './orders/search.dart';
import './splash_screen/pageview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './splash_screen/loginSignupSlide.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

void main() async {
// ...
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
  } catch (e) {
    print('Failed to initialize Firebase: $e');
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/AuthenticateSlideView',
      builder: (context, state) {
        return AuthenticationSlideView();
      },
    ),
    GoRoute(
      path: '/SlideView',
      builder: (context, state) {
        return SlideView();
      },
    ),
    GoRoute(
      path: '/test',
      builder: (context, state) {
        return MyHomePage();
      },
    ),

    //---SPLASH SCREEN ROUTES-----//
    GoRoute(
      path: '/screen1',
      builder: (context, state) {
        return Screen1();
      },
    ),
    GoRoute(
      path: '/screen2',
      builder: (context, state) {
        return Screen2();
      },
    ),
    GoRoute(
      path: '/screen3',
      builder: (context, state) {
        return Screen3();
      },
    ),
    GoRoute(
      path: '/screen4',
      builder: (context, state) {
        return Screen4();
      },
    ),
    GoRoute(
      path: '/screen5',
      builder: (context, state) {
        return Screen5();
      },
    ),
    GoRoute(
      path: '/screen6',
      builder: (context, state) {
        return Screen6();
      },
    ),

    //----ORDER ROUTES----//
    GoRoute(
      path: '/order',
      builder: (context, state) {
        return Orders();
      },
    ),
    GoRoute(
      path: '/order_search',
      builder: (context, state) {
        return SearchProduct();
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
      path: '/dashboard/:user/:email',
      builder: (context, state) {
        final user = state.pathParameters['user']!;
        final email = state.pathParameters['email']!;
        final Map<String, String?> extraParams =
            state.extra as Map<String, String?>;
        final photoURL = extraParams['photoURL'] ?? '';
        final url = extraParams['url'] ?? '';

        return Dashboard(
          user: user,
          email: email,
          photoURL: photoURL,
          url: url,
        );
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
        final userId = state.pathParameters['userId'];
        return ChatNotifications(userId: userId ?? "");
      },
    ),
    GoRoute(
      path: '/chat/:chatId',
      builder: (context, state) {
        final chatId = state.pathParameters['chatId'];
        final userId = ''; // Provide the userId here
        final otherUserId = ''; // Provide the otherUserId here
        return ChatScreen(
            chatId: chatId ?? "", userId: userId, otherUserId: otherUserId);
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
