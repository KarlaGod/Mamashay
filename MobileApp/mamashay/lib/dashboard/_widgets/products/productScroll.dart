import 'package:flutter/material.dart';
import './_product.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
        child: Row(
          children: <Widget>[
            Product(),
            Product(),
            Product(),
            Product(),
            Product(),
            Product(),
            Product(),
          ],
        ),
      ),
    );
  }
}
