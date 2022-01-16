import 'package:flutter/material.dart';
import 'package:food_app/components/dialog_helper.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/models/objects.dart';
import 'package:logger/logger.dart';

class CartProvider extends ChangeNotifier {
  //cart controller instance
  final CartController _cartController = CartController();
  //list to store cart items
  List<CartModel> _cartItems = [];

  //getter for get cart item list
  List<CartModel> get cartItems => _cartItems;

  //User id field
  String userId = "";

  //set already added cart items when fetching userdata
  void setExistingCartItem(UserModel model) {
    _cartItems = model.cartItems;
    userId = model.uid;
    notifyListeners();
  }

  //add to cart function
  void addToCart(ProductModel productModel, BuildContext context) {
    //check wether this product is already added to the cart
    if (!_cartItems.any((e) => e.id == productModel.productId)) {
      //adding items to cart item list

      _cartItems.add(
        CartModel(
          id: productModel.productId,
          amount: 1,
          productModel: productModel,
        ),
      );

      Logger().w(_cartItems.length);

      //save latest cartitemlist to db
      _cartController.updateCartItems(_cartItems, userId);

      //show add to cart dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogHelper(
            iconName: 'shopping-cart 1',
            text1: 'Sucessfully \nadded to cart',
            btnName: 'Check out now',
            btnOntap: () {},
          );
        },
      );
    }

    notifyListeners();
  }

  //getter for get cart total price
  double get cartTotal {
    //cart total price
    double _cartTotal = 0;

    for (var i = 0; i < _cartItems.length; i++) {
      _cartTotal += (_cartItems[i].amount * _cartItems[i].productModel.productPrice);
    }

    return _cartTotal;
  }

  //getter for cart total item count
  int get cartTotalItemCount {
    int _itemCount = 0;

    for (var i = 0; i < _cartItems.length; i++) {
      _itemCount += _cartItems[i].amount;
    }

    return _itemCount;
  }
}
