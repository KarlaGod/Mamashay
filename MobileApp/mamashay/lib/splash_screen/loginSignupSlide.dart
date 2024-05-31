import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../sign_in/sign_in.dart';
import '../SignUp/SignUp.dart';

class AuthenticationSlideView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: null,
          body: PageView(
            children: <Widget>[SignIn(), SignUp()],
          ),
        ));
  }
}
