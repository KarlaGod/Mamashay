import 'package:flutter/material.dart';
import '_vendor.dart';

class Vendors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
        child: Row(
          children: <Widget>[
            Vendor(ImageUrl: 'assets/man.png', name: 'Nworah Gabriel'),
            Vendor(ImageUrl: 'assets/man.png', name: 'Nworah Gabriel'),
            Vendor(ImageUrl: 'assets/man.png', name: 'Nworah Gabriel'),
            Vendor(ImageUrl: 'assets/man.png', name: 'Nworah Gabriel'),
            Vendor(ImageUrl: 'assets/man.png', name: 'Nworah Gabriel'),
            Vendor(ImageUrl: 'assets/man.png', name: 'Nworah Gabriel'),
          ],
        ),
      ),
    );
  }
}
