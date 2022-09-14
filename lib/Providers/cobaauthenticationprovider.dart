import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//!Done Provider G.Doc

class CobaAuthenticationProvider with ChangeNotifier {
  //List<Map<String, dynamic>> _dataAuthentication = [];

  String? _token, _user;

  updateToken(String? tokenData, String? userData) {
    _token = tokenData;
    _user = userData;

    //print(_token);
    notifyListeners();
  }

  String urlMaster =
      'https://flutterauthentication-d72e3-default-rtdb.firebaseio.com/';

  List<Map<String, dynamic>> _dataAuthentication = [];

  List<Map<String, dynamic>> get dataAuthentication {
    return _dataAuthentication;
  }

  //Future addData({String? title, String? token}) async {
  Future addData({String? title}) async {
    var date = DateTime.now().toString();
    // Uri url = Uri.parse(urlMaster + '/list.json');
    Uri url = Uri.parse('$urlMaster/list.json?auth=$_token');

    try {
      var hasilRespon = await http.post(
        url,
        body: json.encode(
          {
            'title': title,
            'subtitle': date,
            'userId': _user,
          },
        ),
      );

      if (hasilRespon.statusCode >= 200 && hasilRespon.statusCode < 300) {
        _dataAuthentication.add(
          {
            'id': json.decode(hasilRespon.body)['name'],
            'title': title,
            'subtitle': date,
            'userId': _user,
          },
        );
      } else {
        throw (hasilRespon.statusCode);
      }
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future removeData({String? id}) async {
    Uri url = Uri.parse('$urlMaster/list/$id.json?auth=$_token');

    try {
      await http.delete(url).then((value) =>
          _dataAuthentication.removeWhere((element) => element['id'] == id));
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future getData() async {
    _dataAuthentication = [];
    Uri url = Uri.parse(
        '$urlMaster/list.json?auth=$_token&orderBy="userId"&equalTo="$_user"');

    try {
      var hasilRespon = await http.get(url);

      if (json.decode(hasilRespon.body) != null) {
        //! sukses masuk karena data tidak null
        var dataRespon = json.decode(hasilRespon.body) as Map<String, dynamic>;

        dataRespon.forEach(
          (key, value) {
            _dataAuthentication.add(
              {
                'id': key,
                'title': value['title'],
                'subtitle': value['subtitle'],
                'userId': value['userId']
              },
            );
          },
        );
      }
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future updateData({String? id, String? title}) async {
    Uri url = Uri.parse('$urlMaster/list/$id.json?auth=$_token');

    try {
      await http
          .patch(
            url,
            body: json.encode(
              {'title': title},
            ),
          )
          .then((_) => _dataAuthentication
              .firstWhere((element) => element['id'] == id)['title'] = title);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
