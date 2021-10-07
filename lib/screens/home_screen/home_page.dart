import 'package:flutter/material.dart';
import 'package:food_app/components/custom_header.dart';
import 'package:food_app/components/custom_textfeild.dart';
import 'package:food_app/utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(
            size: size,
            image: "top.png",
            widget: Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 66),
              child: CustomTextfeild(
                preffix: Icon(
                  Icons.search,
                  color: greyColor,
                ),
                hintText: 'Find your taste',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
