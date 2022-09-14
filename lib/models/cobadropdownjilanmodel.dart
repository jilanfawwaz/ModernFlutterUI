import 'package:flutter/material.dart';
//! Done Model G.Doc

class CobaDropdownJilanModel with ChangeNotifier {
  List<DropdownMenuItem<String>> _dropdownItems = [];

  List<DropdownMenuItem<String>> get dropdownItems {
    return _dropdownItems;
  }

  List<String> _title = [];

  List<String> get title {
    return _title;
  }

  addDropdown({String title = ''}) {
    _title.add(title);
    notifyListeners();
  }

  createDropdown() {
    _dropdownItems = _title
        .map(
          (e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          ),
        )
        .toList();
    notifyListeners();
  }
}
