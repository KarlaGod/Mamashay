import 'package:flutter/material.dart';

class TextHighlight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Use ',
          ),
          TextSpan(
            text: 'Biometrics',
            style: TextStyle(
              color: Color.fromRGBO(02, 102, 102, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ' to sign in next time. ',
          ),
        ],
      ),
    );
  }
}
