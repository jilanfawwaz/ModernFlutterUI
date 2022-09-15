import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//! Done Provider G.Doc

class CobaSharedAndThemeProvider with ChangeNotifier {
  int _number = 0;

  int get number => _number;

  addNumber() async {
    var shared = await SharedPreferences.getInstance();

    _number++;
    print('hei $_number');
    //shared.clear();
    shared.setInt('number', _number);
    notifyListeners();
  }

  decreaseNumber() async {
    var shared = await SharedPreferences.getInstance();

    _number--;
    //print('hei $_number');
    //shared.clear();
    shared.setInt('number', _number);

    notifyListeners();
  }

  Future<bool> getNumberSaved() async {
    var shared = await SharedPreferences.getInstance();

    if (!shared.containsKey('number')) {
      return false;
    }

    //print(shared.getInt('number').toString());
    _number = shared.getInt('number')!;
    notifyListeners();
    return true;
  }

  resetNumberSaved() async {
    var shared = await SharedPreferences.getInstance();
    shared.clear();
    _number = 0;
    notifyListeners();
  }
}
