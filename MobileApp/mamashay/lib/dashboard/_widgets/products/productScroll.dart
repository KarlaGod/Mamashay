import 'package:flutter/material.dart';
import './_product.dart';
import '../firestore_service.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  Map<String, dynamic>? _user;
  final FirestoreService _firestoreService = FirestoreService();
  bool _isLoading = true;

  Products({
    Key? key,
    required this.products,
  }) : super(key: key);

  Future<Map<String, dynamic>?> _fetchUser(String userID) async {
    try {
      Map<String, dynamic>? user = await _firestoreService.getUserById(userID);

      _user = user;
      return user; // Added return statement
    } catch (e) {
      print("Error fetching user: $e"); // Improved error handling
      return null; // Return null in case of an error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // Set scroll direction to horizontal
        height: 300,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> product = products[index];
              print(product["userData"]);
              print(
                  "------------------------qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq-----------------------");
              // return FutureBuilder<Map<String, dynamic>?>(
              //     future: _fetchUser(product["userId"]),
              //     builder: (context, snapshot) {
              //       Map<String, dynamic> user = snapshot.data!;
              //       if (snapshot.data != null) {
              return Product(
                name: product["name"],
                photoURL: product["imageURL"] ?? "assets/chicken.png",
                price: product["price"].toString(),
                description: product["description"],
                userId: product["userId"].toString(),
                userPhotoURL: product["userData"]["profilePicture"],
                displayName: product["userData"]["name"],
              );
            }
            // return SnackBar(content: Text('Failed to load users'));
            // });
            ));
  }
}
// Row(
//           children: <Widget>[
//             Product(),
//             Product(),
//             Product(),
//             Product(),
//             Product(),
//             Product(),
//             Product(),
//           ],
//         ),