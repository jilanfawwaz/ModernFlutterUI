import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/models/cobascheckboxmodel.dart';

class CobaCheckboxProvider with ChangeNotifier {
  //TIPS::List jangan dikasih final karena nilainya akan terus berubah2
  List<CobaCheckboxModel> _data = [];

  List<CobaCheckboxModel> get data {
    return _data;
  }

  addData({String? id, String? title}) {
    _data.add(CobaCheckboxModel(id: id!, title: title!, isSelected: false));
    notifyListeners();
  }

  removeData(String id) {
    _data.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
