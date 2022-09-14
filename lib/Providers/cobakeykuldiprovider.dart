import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/models/cobakeykuldiimodel.dart';
//! Done Provider G.Doc

class CobaKeyKuldiiProvider with ChangeNotifier {
  List<CobaKeyKuldiiModel> _data = [];

  List<CobaKeyKuldiiModel> get data {
    return _data;
  }

  addData({String? title, String? subtitle, DateTime? date}) {
    _data.add(
      CobaKeyKuldiiModel(
        id: DateTime.now().toString(),
        title: title!,
        date: date!,
        subtitle: subtitle!,
      ),
    );
    notifyListeners();
  }

  removeData(String id) {
    _data.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
