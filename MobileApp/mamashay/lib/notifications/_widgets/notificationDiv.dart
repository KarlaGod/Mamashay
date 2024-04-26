import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationDiv extends StatelessWidget {
  final String ImageUrl;
  final String title;
  final String details;
  final String time;

  NotificationDiv(
      {required this.ImageUrl,
      required this.title,
      required this.details,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          GoRouter.of(context).go('/test');
        },
        child: Container(
            child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(107, 123, 66, 0.06),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 10,
                                0), // Add padding of 20.0 to all sides
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      ImageUrl,
                                      width: 2 * 15,
                                      height: 2 * 15,
                                      fit: BoxFit.cover,
                                    )),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(8, 5, 80, 0),
                                      child: Text(
                                        title,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromRGBO(77, 77, 77, 1)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 5,
                                          0), // Add padding of 20.0 to all sides
                                      child: Text(
                                        details,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromRGBO(
                                                153, 153, 153, 1)),
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 10, 10,
                                    0), // Add padding of 20.0 to all sides
                                child: Text(
                                  time,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(153, 153, 153, 1)),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(30, 5, 5, 0),
                                  // Add padding of 20.0 to all sides
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(172, 194, 112, 1),
                                      shape: BoxShape.circle,
                                    ),
                                  )),
                            ],
                          )
                        ])))));
  }
}
