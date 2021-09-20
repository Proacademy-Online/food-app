// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextfeild extends StatelessWidget {
  CustomTextfeild({
    Key? key,
    required this.controller,
  }) : super(key: key);

  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red)),
        ),
      ),
    );
  }
}
