import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CounterProvider extends ChangeNotifier {
  //counter variable
  int _counter = 0;

  //get counter value
  int get getCounter => _counter;

  //increase counter
  void increaseCounter() {
    _counter++;
    Logger().i(_counter);
    notifyListeners();
  }

  //decrease counter
  void decreaseCounter() {
    _counter--;
    Logger().i(_counter);
    notifyListeners();
  }
}
