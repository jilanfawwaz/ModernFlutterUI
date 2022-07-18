import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CobaAuthenticationProvider with ChangeNotifier {
  //List<Map<String, dynamic>> _dataAuthentication = [];

  String urlMaster =
      'https://flutterauthentication-d72e3-default-rtdb.firebaseio.com/';

  List<Map<String, dynamic>> _dataAuthentication = [];

  List<Map<String, dynamic>> get dataAuthentication {
    return _dataAuthentication;
  }

  Future addData({String? title, String? token}) async {
    var date = DateTime.now().toString();
    // Uri url = Uri.parse(urlMaster + '/list.json');
    Uri url = Uri.parse('$urlMaster/list.json?auth=$token');

    try {
      var hasilRespon = await http.post(
        url,
        body: json.encode(
          {
            'title': title,
            'subtitle': date,
          },
        ),
      );

      if (hasilRespon.statusCode >= 200 && hasilRespon.statusCode < 300) {
        _dataAuthentication.add(
          {
            'id': json.decode(hasilRespon.body)['name'],
            'title': title,
            'subtitle': date,
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
}
