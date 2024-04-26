import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) {
                return FractionallySizedBox(
                  heightFactor: 0.5, // Half of the screen height
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Content of the popup goes here
                        ListTile(
                          title: Text('Popup Content'),
                        ),
                        // Add more widgets as needed
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Text('Show Popup'),
        ),
      ),
    );
  }
}
