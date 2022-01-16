import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar_button.dart';
import 'package:food_app/components/custom_text.dart';
import 'package:food_app/components/product_card.dart';
import 'package:food_app/providers/cart/cart_provider.dart';
import 'package:food_app/screens/main_screens/cart_screen/cart_item.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/util_functions.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UpperSection(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: double.infinity,
                height: 111,
                decoration: BoxDecoration(
                  color: korange,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 23,
                      left: 23,
                      child: Icon(
                        Icons.location_on_outlined,
                        color: kwhite,
                      ),
                    ),
                    Positioned(
                      top: 23,
                      left: 54,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Delivered to:',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kwhite,
                          ),
                          CustomText(
                            text: '242 ST Marks Eve, \nFinland ',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kwhite,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 52,
                      right: 17,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: kwhite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Consumer<CartProvider>(
              builder: (context, value, child) {
                return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartItem(model: value.cartItems[index]);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                );
              },
            )),
            FooterSection(size: size),
          ],
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 2.7,
      child: Stack(
        children: [
          Image.asset(
            Constants.imageAsset('cart-footer.png'),
            width: size.width,
            height: size.height / 2.7,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 111, right: 50, left: 50),
            child: Column(
              children: [
                CartAmountRow(text: 'Item total', price: '\$ 12.49'),
                SizedBox(height: 10),
                CartAmountRow(text: 'Discount', price: '\- \$ 10'),
                SizedBox(height: 10),
                CartAmountRow(text: 'Tax', price: '\$ 2'),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Total',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: '\$ 12.49',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: CustomText(
                      text: 'Continue',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartAmountRow extends StatelessWidget {
  const CartAmountRow({Key? key, required this.text, required this.price}) : super(key: key);

  final String text;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        CustomText(
          text: price,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}

class CartItems extends StatelessWidget {
  const CartItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppBarButton(ontap: () {
          UtilFunctions.goBack(context);
        }),
        SizedBox(width: 150),
        CustomText(
          text: 'Cart',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: secondarytxtColor,
        ),
      ],
    );
  }
}
