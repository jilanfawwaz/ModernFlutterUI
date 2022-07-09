import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/models/cobacheckboxmodel.dart';

class CobaCheckboxProvider with ChangeNotifier {
  //TIPS::List jangan dikasih final karena nilainya akan terus berubah2
  bool _selectAll = false;

  bool get selectAll {
    return _selectAll;
  }

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

  changeCheckoxStatusAllDeselect() {
    _selectAll = false;
  }

  changeCheckboxStatusAll() {
    _data.forEach((element) {
      element.isSelected = !_selectAll;
    });
    _selectAll = !_selectAll;
    notifyListeners();
  }

  changeBoxStatus(String id, bool status) {
    _data.firstWhere((element) => element.id == id).isSelected = status;
    notifyListeners();
    //_data.where((element) => element.id == id);
  }
}
