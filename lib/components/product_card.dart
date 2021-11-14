import 'package:flutter/material.dart';
import 'package:food_app/components/image_tile.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/util_functions.dart';
import 'custom_text.dart';
import 'dialog_helper.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 20,
              color: Colors.black12,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const ImageTile(
                isOffer: true,
                width: 90,
                height: 90,
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomText(text: 'Vegitable Salad', fontSize: 14),
                  CustomText(
                      text: 'In Pizza Mania', fontSize: 12, color: greyColor),
                  CustomText(
                      text: 'Price. 152.00',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
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
            },
            child: const Icon(
              Icons.add,
              color: greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
