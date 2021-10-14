import 'package:flutter/material.dart';
import 'package:food_app/components/custom_images.dart';
import 'package:food_app/screens/main_screens/cart_screen/cart_screen.dart';
import 'package:food_app/screens/main_screens/home_screen/home_page.dart';
import 'package:food_app/screens/main_screens/profile_screen/profile_screen.dart';
import 'package:food_app/utils/app_colors.dart';
import 'search_screen/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomePage(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBG,
      body: _screens.elementAt(_currentIndex),
      bottomNavigationBar: Container(
        height: 90,
        color: kwhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavTile(
              icon: 'home',
              isSelected: _currentIndex == 0,
              ontap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            BottomNavTile(
              icon: 'search',
              isSelected: _currentIndex == 1,
              ontap: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            BottomNavTile(
              icon: 'cart',
              isSelected: _currentIndex == 2,
              ontap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            BottomNavTile(
              icon: 'profile',
              isSelected: _currentIndex == 3,
              ontap: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
            ),
          ],
        ),
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
