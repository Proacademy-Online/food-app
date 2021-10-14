import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: const SizedBox(
        child: Center(
          child: CustomText(
            text: 'Search Screen',
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
