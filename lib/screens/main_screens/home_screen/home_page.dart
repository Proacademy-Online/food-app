import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_header.dart';
import 'package:food_app/components/custom_textfeild.dart';
import 'package:food_app/components/custom_title.dart';
import 'package:food_app/utils/app_colors.dart';
import 'widgets/category_section.dart';
import 'widgets/choose_location_section.dart';
import 'widgets/nearest_restaurents_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeInLeft(
      child: Column(
        children: [
          UpperSection(size: size),
          const BottomSection(),
        ],
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 34),
            CategorySection(),
            SizedBox(height: 20),
            CustomTitle(text: 'Nearest Restaurents'),
            SizedBox(height: 11),
            NearestRestaurentsSection(),
            SizedBox(height: 26),
            CustomTitle(text: 'Popular Restaurents'),
            SizedBox(height: 11),
            NearestRestaurentsSection(),
            SizedBox(height: 20),
          ],
        ),
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
    return Column(
      children: [
        CustomHeader(
          size: size,
          image: "top.png",
          widget: const Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 66),
            child: CustomTextfeild(
              hintText: 'Find your taste',
              preffix: Icon(
                Icons.search,
                color: greyColor,
              ),
            ),
          ),
        ),
        const ChooseLocationSection()
      ],
    );
  }
}
