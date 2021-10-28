import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar_button.dart';
import 'package:food_app/components/custom_images.dart';
import 'package:food_app/components/custom_text.dart';
import 'package:food_app/components/custom_title.dart';
import 'package:food_app/components/product_card.dart';
import 'package:food_app/screens/main_screens/restaurant_menu/restaurant_menu.dart';
import 'package:food_app/screens/main_screens/restaurent_details_screen/restaurant_category_section.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/util_functions.dart';

class RestaurentDeailsScreen extends StatefulWidget {
  const RestaurentDeailsScreen({Key? key}) : super(key: key);

  @override
  _RestaurentDeailsScreenState createState() => _RestaurentDeailsScreenState();
}

class _RestaurentDeailsScreenState extends State<RestaurentDeailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Column(
          children: [
            UpperSection(size: size),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RestaurentDetailsSection(),
                  const SizedBox(height: 23),
                  const ResCategorySection(),
                  const SizedBox(height: 20),
                  const CustomTitle(text: 'Best Products'),
                  const SizedBox(height: 20),
                  const ProductListSection(),
                  GestureDetector(
                    onTap: () {
                      UtilFunctions.navigateTo(context, const RestaurantMenu());
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 40, bottom: 10, top: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CustomText(
                          text: 'See our menu',
                          color: korange,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductListSection extends StatelessWidget {
  const ProductListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(bottom: 20, top: 5),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const ProductCard();
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 3,
      ),
    );
  }
}

class ResCategoryTile extends StatefulWidget {
  const ResCategoryTile({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  final String categoryName;

  @override
  State<ResCategoryTile> createState() => _ResCategoryTileState();
}

class _ResCategoryTileState extends State<ResCategoryTile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Container(
              // width: 65,
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? korange : kwhite,
                borderRadius: BorderRadius.circular(15),
              ),
              child: CustomText(
                text: widget.categoryName,
                fontSize: 14,
                color: isSelected ? kwhite : greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurentDetailsSection extends StatelessWidget {
  const RestaurentDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Westway',
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
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
                            fontSize: 15,
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
                            fontSize: 15,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const CustomText(
                text: 'More info',
                fontSize: 14,
                color: korange,
              ),
            ],
          ),
          const SizedBox(height: 10),
          const CustomText(
            text:
                'Healthy eating means eating a variety of foods that give you the nutrients you need to maintain your health, feel good, and have energy.',
            fontSize: 15,
            color: greyColor,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: 320,
            child: const ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(65),
                bottomRight: Radius.circular(65),
              ),
              child: CustomNetworkImage(
                url:
                    'https://www.kitchensanctuary.com/wp-content/uploads/2020/12/Quick-Chicken-Ramen-square-FS-22.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarButton(ontap: () {}),
                  Row(
                    children: [
                      AppBarButton(iconName: 'heart', ontap: () {}),
                      const SizedBox(width: 16),
                      AppBarButton(iconName: 'feather_share', ontap: () {}),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
