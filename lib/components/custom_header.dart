import 'package:flutter/material.dart';
import 'package:food_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key? key,
    required this.size,
    required this.header,
    required this.tagline,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;
  final String header;
  final String tagline;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Constants.imageAsset(image),
          width: size.width,
          fit: BoxFit.fitWidth,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                header,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                tagline,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
