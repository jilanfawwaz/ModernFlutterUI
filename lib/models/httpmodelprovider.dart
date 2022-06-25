import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpModelProvider with ChangeNotifier {
  Map<String, dynamic> _dataRespon = {};
  Map<String, dynamic> get dataRespon {
    return _dataRespon;
  }

  int get jumlahData {
    return _dataRespon.length;
  }

  Uri url = Uri.parse("https://reqres.in/api/users");

  void connectApi(String name, String job) async {
    var hasilRespon = await http.post(
      url,
      body: {"name": name, "job": job},
    );

    _dataRespon = json.decode(hasilRespon.body);
    notifyListeners();
  }
}
