import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: const SizedBox(
        child: Center(
          child: CustomText(
            text: 'Cart Screen',
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
