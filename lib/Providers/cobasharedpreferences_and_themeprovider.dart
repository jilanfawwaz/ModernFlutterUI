import 'package:flutter/material.dart';

class CobaSharedAndThemeProvider with ChangeNotifier {
  int _number = 0;

  int get number => _number;

  addNumber() {
    _number++;
    notifyListeners();
  }

  decreaseNumber() {
    _number--;
    notifyListeners();
  }
}
