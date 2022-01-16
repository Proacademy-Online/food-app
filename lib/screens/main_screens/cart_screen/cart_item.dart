import 'package:flutter/material.dart';
import 'package:food_app/components/custom_text.dart';
import 'package:food_app/components/image_tile.dart';
import 'package:food_app/models/objects.dart';
import 'package:food_app/utils/app_colors.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.model}) : super(key: key);

  final CartModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 20,
              color: Colors.black12,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ImageTile(
                  imgUrl: model.productModel.img,
                  isOffer: false,
                  width: 90,
                  height: 90,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: model.productModel.productName,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.remove),
                        ),
                        const SizedBox(width: 15),
                        CustomText(
                          text: model.amount.toString(),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.add),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.close,
                  color: korange,
                ),
                CustomText(
                  text: "Rs. ${model.productModel.productPrice}0",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ],
            )
          ],
        )

        // Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       const ImageTile(
        //         isOffer: false,
        //         width: 90,
        //         height: 90,
        //       ),
        //       const SizedBox(width: 5),
        //       Column(
        //         children: [
        //           CustomText(
        //             text: 'Burger with some',
        //             fontSize: 14,
        //             fontWeight: FontWeight.w400,
        //           ),
        //           Container(
        //             width: 100,
        //             height: 32,
        //             decoration: BoxDecoration(
        //               color: Color(0xffF8F8FA),
        //               borderRadius: BorderRadius.circular(12),
        //             ),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 IconButton(
        //                     onPressed: () {},
        //                     icon: Icon(Icons.add),
        //                     iconSize: 10),
        //                 CustomText(
        //                   text: '1',
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.w500,
        //                 ),
        //                 IconButton(
        //                     onPressed: () {},
        //                     icon: Icon(Icons.remove),
        //                     iconSize: 10),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           IconButton(
        //               onPressed: () {}, icon: Icon(Icons.close), iconSize: 15),
        //           CustomText(
        //             text: '152',
        //             fontSize: 15,
        //             fontWeight: FontWeight.w500,
        //           )
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
