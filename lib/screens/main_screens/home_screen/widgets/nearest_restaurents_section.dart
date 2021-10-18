import 'package:flutter/material.dart';
import 'package:food_app/components/custom_images.dart';
import 'package:food_app/components/custom_text.dart';
import 'package:food_app/components/image_tile.dart';
import 'package:food_app/screens/main_screens/restaurent_details_screen/restaurent_details_screen.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/util_functions.dart';

class NearestRestaurentsSection extends StatelessWidget {
  const NearestRestaurentsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: const [
            RestaurentTile(
              isOffer: true,
            ),
            RestaurentTile(),
            RestaurentTile(),
            RestaurentTile(),
          ],
        ),
      ),
    );
  }
}

class RestaurentTile extends StatelessWidget {
  const RestaurentTile({
    Key? key,
    this.isOffer = false,
  }) : super(key: key);

  final bool isOffer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          UtilFunctions.navigateTo(context, const RestaurentDeailsScreen()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageTile(isOffer: isOffer),
          const SizedBox(height: 5),
          const CustomText(
            text: 'Westway',
            fontSize: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: primaryColor,
                    size: 15,
                  ),
                  CustomText(
                    text: '4.6  • ',
                    fontSize: 12,
                  )
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.timer,
                    color: greyColor,
                    size: 15,
                  ),
                  SizedBox(width: 3),
                  CustomText(
                    text: '15 min',
                    fontSize: 12,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OfferTag extends StatelessWidget {
  const OfferTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: 79,
        height: 28,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: korange,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: const CustomText(
          text: '50% OFF',
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: kwhite,
        ),
      ),
    );
  }
}
