import 'package:flutter/material.dart';
import 'package:food_app/utils/constants.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key? key,
    required this.image,
    this.header,
    this.tagline,
    required this.size,
    this.widget,
  }) : super(key: key);

  final Size size;
  final String image;
  final String? header;
  final String? tagline;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Constants.imageAsset(
            image,
          ),
          width: size.width,
          fit: BoxFit.fitWidth,
        ),
        widget == null
            ? Center(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      header ?? "",
                      style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      tagline ?? "",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            : widget!,
      ],
    );
  }
}
