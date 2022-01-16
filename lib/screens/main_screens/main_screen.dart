import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_images.dart';
import 'package:food_app/components/custom_text.dart';
import 'package:food_app/providers/home/bottom_nav_provider.dart';
import 'package:food_app/screens/main_screens/cart_screen/cart_screen.dart';
import 'package:food_app/screens/main_screens/home_screen/home_page.dart';
import 'package:food_app/screens/main_screens/profile_screen/profile_screen.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'search_screen/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomePage(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  Future<bool> initBackButton() async {
    Logger().d('back button pressed');
    return await showDialog(
          context: context,
          builder: (context) => ElasticIn(
            child: AlertDialog(
              title: const CustomText(text: 'Exit App'),
              content: const CustomText(text: 'Do you really want to exit an App ?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const CustomText(text: 'No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const CustomText(text: 'Yes'),
                ),
              ],
            ),
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: initBackButton,
      child: Consumer<BottomNavProvider>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: mainBG,
            body: _screens.elementAt(value.activeIndex),
            bottomNavigationBar: Container(
              height: 90,
              color: kwhite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavTile(
                    icon: 'home',
                    isSelected: value.activeIndex == 0,
                    ontap: () {
                      value.onItemTapped(0);
                    },
                  ),
                  BottomNavTile(
                    icon: 'search',
                    isSelected: value.activeIndex == 1,
                    ontap: () {
                      value.onItemTapped(1);
                    },
                  ),
                  BottomNavTile(
                    icon: 'cart',
                    isSelected: value.activeIndex == 2,
                    ontap: () {
                      value.onItemTapped(2);
                    },
                  ),
                  BottomNavTile(
                    icon: 'profile',
                    isSelected: value.activeIndex == 3,
                    ontap: () {
                      value.onItemTapped(3);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BottomNavTile extends StatelessWidget {
  const BottomNavTile({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.ontap,
  }) : super(key: key);

  final String icon;
  final bool isSelected;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : kwhite,
          borderRadius: BorderRadius.circular(15),
        ),
        child: CustomSvg(
          svgName: icon,
          color: isSelected ? kwhite : greyColor,
        ),
      ),
    );
  }
}
