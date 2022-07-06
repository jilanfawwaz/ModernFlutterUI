import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/models/cobakeykuldiimodel.dart';

class CobaKeyKuldiiProvider with ChangeNotifier {
  List<CobaKeyKuldiiModel> _data = [];

  List<CobaKeyKuldiiModel> get data {
    return _data;
  }

  addData(String title, String subtitle, DateTime date) {
    _data.add(
      CobaKeyKuldiiModel(
          id: DateTime.now().toString(),
          title: title,
          date: DateTime.now(),
          subtitle: subtitle),
    );
    notifyListeners();
  }

  removeData(CobaKeyKuldiiModel tile) {
    _data.remove(tile);
    notifyListeners();
  }

  connectApi(
      {String? title,
      String? subtitle,
      DateTime? date}){_data.add(
      CobaKeyKuldiiModel(
          id: DateTime.now().toString(),
          title: title!,
          date: DateTime.now(),
          subtitle: subtitle!),
    );
    notifyListeners();}
}
