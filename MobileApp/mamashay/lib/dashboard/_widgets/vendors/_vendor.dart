import 'package:flutter/material.dart';
import '_vendor.dart';

class Vendor extends StatelessWidget {
  final String ImageUrl;
  final String name;

  Vendor({required this.ImageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.fromLTRB(5, 20, 10, 10),
          child: Container(
              width: 100,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(107, 123, 66, 0.06),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          ImageUrl,
                          width: 2 * 20,
                          height: 2 * 20,
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      name,
                      style: TextStyle(color: Color.fromRGBO(179, 179, 179, 1)),
                    )
                  ],
                ),
              ))),
    );
  }
}