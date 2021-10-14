import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: const SizedBox(
        child: Center(
          child: CustomText(
            text: 'Profile Screen',
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
