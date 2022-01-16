import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/models/objects.dart';
import 'package:logger/logger.dart';

class CartController {
  // Firestore instance create
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a collection refferance
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //update user selected address
  Future<void> updateCartItems(List<CartModel> cartItems, String userid) async {
    List list = [];

    for (var i = 0; i < cartItems.length; i++) {
      list.add(cartItems[i].toJson());
    }

    return users
        .doc(userid)
        .update({
          'cartItems': list,
        })
        .then((value) => Logger().i("cart items updated"))
        .catchError((error) => Logger().e("Failed to update cart items: $error"));
  }
}
