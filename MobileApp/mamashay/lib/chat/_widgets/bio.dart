import 'package:flutter/material.dart';

class DescriptionWidget extends StatefulWidget {
  @override
  _DescriptionWidgetState createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<StatefulWidget> {
  bool showFullText = false;

  void toggleText() {
    setState(() {
      showFullText = !showFullText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: 'Description: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: showFullText
                          ? 'we sell homemade food, drinks and snacks, we also have event packages as well. you can always contact us from Monday to Saturday for our services and we will respond immediately.'
                          : 'we sell homemade food, drinks and snacks, we also have' +
                              '...',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                // overflow: TextOverflow.ellipsis,
                maxLines: showFullText ? null : 2,
              ),
            )),
            SizedBox(
              width: 7.0,
            ),
            ElevatedButton(
                onPressed: toggleText,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(172, 194, 112, 1),
                  // shadowColor: Color.fromRGBO(172, 194, 112, 0),
                  //   padding: const EdgeInsets.fromLTRB(
                  //       15, 5, 15, 5), // Change the background color here
                  // ),
                ),
                child: Row(children: [
                  Text(
                    showFullText ? 'Less' : 'More',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    showFullText
                        ? 'assets/arrow_up.png'
                        : 'assets/arrow_down.png',
                    width: 2 * 5,
                    height: 2 * 8,
                  ),
                ]))
          ],
        ));
  }
}
