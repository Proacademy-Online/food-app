import 'package:flutter/material.dart';
import 'package:food_app/components/image_tile.dart';
import 'package:food_app/utils/app_colors.dart';
import 'custom_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
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
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Vegitable Salad',
                    fontSize: 14,
                  ),
                  CustomText(
                    text: 'In Pizza Mania',
                    fontSize: 12,
                    color: greyColor,
                  ),
                  CustomText(
                    text: 'Price. 152.00',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.add,
            color: greyColor,
          )
        ],
      ),
    );
  }
}
