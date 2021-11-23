import 'package:flutter/material.dart';
import 'package:food_app/components/custom_text.dart';
import 'package:food_app/providers/counter_provider.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/util_functions.dart';
import 'package:provider/provider.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Consumer<CounterProvider>(
            builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ElevatedButton(
                  //   onPressed: () {
                  //     value.increaseCounter();
                  //   },
                  //   child: const CustomText(
                  //     text: '+',
                  //     color: kwhite,
                  //   ),
                  // ),
                  CustomText(
                    text: '${value.getCounter}',
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     value.decreaseCounter();
                  //   },
                  //   child: const CustomText(
                  //     text: '-',
                  //     color: kwhite,
                  //   ),
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      UtilFunctions.goBack(context);
                    },
                    child: const CustomText(
                      text: 'Go back to 1st',
                      color: kwhite,
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
