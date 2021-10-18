import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar_button.dart';
import 'package:food_app/components/custom_images.dart';
import 'package:food_app/components/custom_text.dart';
import 'package:food_app/components/custom_title.dart';
import 'package:food_app/components/image_tile.dart';
import 'package:food_app/components/product_card.dart';
import 'package:food_app/utils/app_colors.dart';

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
      body: Container(
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
        padding: EdgeInsets.only(bottom: 20, top: 5),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ProductCard();
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: 3,
      ),
    );
  }
}

class ResCategorySection extends StatelessWidget {
  const ResCategorySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(text: 'Westway Food Menu'),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.only(left: 30),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                ResCategoryTile(
                  categoryName: 'All',
                ),
                ResCategoryTile(
                  categoryName: 'Pizza',
                ),
                ResCategoryTile(
                  categoryName: 'Beverages',
                ),
                ResCategoryTile(
                  categoryName: 'Asian',
                ),
                ResCategoryTile(
                  categoryName: 'All',
                ),
              ],
            ),
          ),
        )
      ],
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
              padding: EdgeInsets.symmetric(horizontal: 16),
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
                  CustomText(
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
              CustomText(
                text: 'More info',
                fontSize: 14,
                color: korange,
              ),
            ],
          ),
          SizedBox(height: 10),
          CustomText(
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
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: 320,
            child: ClipRRect(
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
                      SizedBox(width: 16),
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
