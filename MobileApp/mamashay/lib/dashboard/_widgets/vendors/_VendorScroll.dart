import 'package:flutter/material.dart';
import './_vendor.dart'; // Import your custom Vendor widget

class Vendors extends StatelessWidget {
  final List<Map<String, dynamic>> users;

  const Vendors({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Set a fixed height for horizontal scrolling
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> user = users[index];

          return Vendor(
            imageUrl: user["profilePicture"] ?? './assets/man.png',
            name: user["name"] == null ? "New User" : user['name'],
            id: "aaaa",
            email: user["email"] == null ? "Newuser@gmail.com" : user['email'],
            isUrl: user["profilePicture"] == null ? "false" : "true",
          );
        },
      ),
    );
  }
}




//  Vendor(
//             imageUrl: user['profilePicture'] ?? 'assets/man.png',
//             name: user['name'] ?? 'No name',
//             email: user['email'] ?? 'No email',
//             createdAt: createdAt.toDate(),
//             productsRef: productsRef.path,
//           );