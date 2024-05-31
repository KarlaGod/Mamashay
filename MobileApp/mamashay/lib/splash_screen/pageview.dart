import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './screen1.dart';
import './screen2.dart';
import './screen3.dart';
import './screen4.dart';
import './screen5.dart';
import './screen6.dart';

class SlideView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: null,
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(107, 123, 66, 0.1),
                  // image: DecorationImage(
                  //   image: AssetImage('assets/Splash_screen.png'),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(107, 123, 66, 0.1),
                    image: DecorationImage(
                      image: AssetImage('assets/Splash_screen.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: PageView(
                    children: <Widget>[
                      Screen2(),
                      Screen3(),
                      Screen4(),
                      Screen5(),
                      Screen6(),
                    ],
                  ),
                ))));
  }
}
