import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  //selected bottom nav index
  int _currentIndex = 0;

  //getter for get selected index
  int get activeIndex => _currentIndex;

  //set selected bottom nav index
  void onItemTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
