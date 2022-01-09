import 'package:flutter/material.dart';
import 'package:food_app/screens/main_screens/home_screen/widgets/nearest_restaurents_section.dart';
import 'custom_images.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    Key? key,
    this.isOffer = false,
    this.width = 120,
    this.height = 120,
    this.imgUrl = 'https://www.kitchensanctuary.com/wp-content/uploads/2020/12/Quick-Chicken-Ramen-square-FS-22.jpg',
  }) : super(key: key);

  final bool isOffer;
  final double width;
  final double height;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(right: 20),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CustomNetworkImage(
              url: imgUrl,
              width: width,
              height: height,
              fit: BoxFit.fill,
            ),
          ),
          isOffer ? const OfferTag() : Container()
        ],
      ),
    );
  }
}
