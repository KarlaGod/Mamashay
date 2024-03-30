import 'package:flutter/material.dart';

class HalfBorderButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onPressed;

  HalfBorderButton(
      {required this.text, required this.isActive, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isActive
                ? const Color.fromRGBO(172, 194, 112, 1)
                : Colors.transparent,
            width: 3.0,
          ),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: isActive ? Color.fromRGBO(172, 194, 112, 1) : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }
}
