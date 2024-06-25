import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Vendor extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String isUrl;
  final String id;
  final String email;

  Vendor({
    required this.imageUrl,
    required this.name,
    required this.id,
    required this.isUrl,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              GoRouter.of(context).go(
                '/profile/${Uri.encodeComponent(name)}/${Uri.encodeComponent(email)}',
                extra: {
                  'photoURL': imageUrl, // Handle nullable photoURL
                  'url': 'true', // Replace with actual URL if needed
                },
              )
            },
        child: Container(
          child: Padding(
              padding: EdgeInsets.fromLTRB(5, 20, 10, 10),
              child: Container(
                  width: 100,
                  height: 100,
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
                          child: isUrl == "true"
                              ? Image.network(
                                  imageUrl,
                                  width: 2 * 20,
                                  height: 2 * 20,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  imageUrl,
                                  width: 2 * 20,
                                  height: 2 * 20,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          name,
                          style: TextStyle(
                              color: Color.fromRGBO(179, 179, 179, 1)),
                        )
                      ],
                    ),
                  ))),
        ));
  }
}
