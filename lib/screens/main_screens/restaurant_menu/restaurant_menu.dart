import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar_button.dart';
import 'package:food_app/components/custom_text.dart';
import 'package:food_app/components/custom_title.dart';
import 'package:food_app/components/product_card.dart';
import 'package:food_app/screens/main_screens/restaurent_details_screen/restaurant_category_section.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/util_functions.dart';

class RestaurantMenu extends StatefulWidget {
  const RestaurantMenu({Key? key}) : super(key: key);

  @override
  _RestaurantMenuState createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            UpperSection(),
            SizedBox(height: 22),
            ResCategorySection(),
            SizedBox(height: 18),
            CustomTitle(text: 'Best Sellers'),
            ProductList(),
            FooterSection()
          ],
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73,
      color: Colors.green,
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CustomText(
              text: '3 items',
              color: kwhite,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            Row(
              children: [
                const CustomText(
                  text: 'View Cart',
                  color: kwhite,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(width: 14),
                Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: CustomText(
                      text: '\$ 20.49',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kwhite,
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(width: 14),
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 6,
        itemBuilder: (context, index) => const ProductCard(),
        separatorBuilder: (context, index) => const Divider(),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarButton(ontap: () {
          UtilFunctions.goBack(context);
        }),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomText(
              text: 'Westway',
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: secondarytxtColor,
            ),
            CustomText(
              text: 'Menu',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: primaryTxtColor,
            ),
          ],
        ),
        AppBarButton(
          ontap: () {},
          iconName: 'ion_options-outline',
        )
      ],
    );
  }
}
