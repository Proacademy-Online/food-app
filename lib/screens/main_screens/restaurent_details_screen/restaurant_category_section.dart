import 'package:flutter/material.dart';
import 'package:food_app/components/custom_title.dart';
import 'package:food_app/screens/main_screens/restaurent_details_screen/restaurent_details_screen.dart';

class ResCategorySection extends StatelessWidget {
  const ResCategorySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitle(text: 'Westway Food Menu'),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.only(left: 30),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: const [
                ResCategoryTile(
                  categoryName: 'All',
                ),
                ResCategoryTile(
                  categoryName: 'Veg',
                ),
                ResCategoryTile(
                  categoryName: 'Non-Veg',
                ),
                ResCategoryTile(
                  categoryName: 'Beverages',
                ),
                ResCategoryTile(
                  categoryName: 'Asian',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
