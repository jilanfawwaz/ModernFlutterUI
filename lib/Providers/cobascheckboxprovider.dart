import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/models/cobacheckboxmodel.dart';

import 'package:http/http.dart' as http;

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

  List<CobaCheckboxModel> _changedData = [];

  List<CobaCheckboxModel> get changedData {
    return _changedData;
  }

  //tambah child checkbox
  /*addData({String? id, String? title}) {
    _data.add(CobaCheckboxModel(id: id!, title: title!, isSelected: false));
    notifyListeners();
  }*/

  addData({String? title}) async {
    try {
      //TIPS:Url json harus make .json dibelakangnya
      Uri url = Uri.parse(
          "https://http-req-a092b-default-rtdb.firebaseio.com/checkbox.json");

      await http
          .post(
        url,
        body: json.encode(
          {
            "title": title,
            "isSelected": false,
          },
        ),
      )
          .then(
        (value) {
          //TIPS:return value dari post, untuk menggunakannya harus di json.decode dulu
          print(json.decode(value.body)["name"]);
          _data.add(
            CobaCheckboxModel(
                id: json.decode(value.body)["name"],
                title: title!,
                isSelected: false),
          );
          changeCheckboxStatusAllDeselect();
        },
      );
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  getData() async {
    Uri url = Uri.parse(
        "https://http-req-a092b-default-rtdb.firebaseio.com/checkbox.json");

    var _hasilRespon = await http.get(url);

    if (json.decode(_hasilRespon.body) != null) {
      var _dataRespon = jsonDecode(_hasilRespon.body) as Map<String, dynamic>;

      _dataRespon.forEach((key, value) {
        _data.add(
          CobaCheckboxModel(
            id: key,
            title: value['title'],
            isSelected: value['isSelected'],
          ),
        );
      });
    }
    notifyListeners();
  }

  //hapus child checkbox
  removeData(String id) async {
    Uri url = Uri.parse(
        "https://http-req-a092b-default-rtdb.firebaseio.com/checkbox/$id/.json");

    await http.delete(url).then((value) {
      _data.removeWhere((element) => element.id == id);
    });

    notifyListeners();
  }

  //kalau selectAll dijadiin true, semua child checkbox akan ikut true, begitu pula sebaliknya
  /*changeCheckboxStatusAll() {
    _data.forEach((element) {
      element.isSelected = !_selectAll;
    });
    _selectAll = !_selectAll;
    notifyListeners();
  }*/

  changeCheckboxStatusAll() {
    _changedData.clear();
    _data.forEach((element) {
      element.isSelected = !_selectAll;

      _changedData.add(_data
          .firstWhere((elementChanged) => elementChanged.id == element.id));
    });
    print(_changedData);
    _selectAll = !_selectAll;
    notifyListeners();
  }

  //kalau awalnya selectAll dijadiin true, terus semua child checkbox ikut true, kalau ada child checkbox yang diubah kembali menjadi false, select all akan ikut false
  changeCheckboxStatusAllDeselect() {
    _selectAll = false;
  }

  //mengecek, kalau semua child checkbox true, checkbox select all akan true juga
  checkSelectedAll() {
    _selectAll = true;
    _data.forEach((element) {
      if (element.isSelected == false) _selectAll = false;
    });
    notifyListeners();
  }

  injectCheckboxToFirebase() {
    if (_changedData != []) {
      _changedData.forEach(
        (element) async {
          await http
              .patch(
            Uri.parse(
                "https://http-req-a092b-default-rtdb.firebaseio.com/checkbox/${element.id}/.json"),
            body: json.encode(
              {
                'isSelected': element.isSelected,
              },
            ),
          )
              .then((value) {
            _changedData.clear();
          });
        },
      );
    }
    notifyListeners();
  }

  //mengubah nilai bool child checkbox tanpa firebase
  /*changeBoxStatus(String id, bool status) {
    _data.firstWhere((element) => element.id == id).isSelected = status;
    notifyListeners();
    //_data.where((element) => element.id == id);
  }*/

  //yang ini changeboxstatus sebelum ditambah changedData tapi udah connect ke firebase (lambat karena harus update firebase setiap checkbox berubah)
  /*Future changeBoxStatus(String id, bool status) async {
    Uri url = Uri.parse(
        "https://http-req-a092b-default-rtdb.firebaseio.com/checkbox/$id/.json");

    await http
        .patch(
      url,
      body: json.encode(
        {"isSelected": status},
      ),
    )
        .then((value) {
      _data.firstWhere((element) => element.id == id).isSelected = status;
    });

    notifyListeners();
    //_data.where((element) => element.id == id);
  }*/

  //setiap checkbox berubah, perubahan akan ditaroh di changedData, yang nanti diinject ke firebase ya si changedData tadi ketika aplikasi dikeluarkan
  changeBoxStatus(String id, bool status) async {
    _data.firstWhere((element) => element.id == id).isSelected = status;

    //  if(!_changedData.contains(_changedData.firstWhere((element) => element['id']== id))){
    //   _changedData.add({'id':id, 'isSelected':status});
    //  }

    if (!_changedData
        .contains(_data.firstWhere((element) => element.id == id))) {
      _changedData.add(_data.firstWhere((element) => element.id == id));
    } else if (_changedData
        .contains(_data.firstWhere((element) => element.id == id))) {
      _changedData.remove(_data.firstWhere((element) => element.id == id));
    }
    print(_changedData);

    notifyListeners();
  }
}
