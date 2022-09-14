import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
//! Done Model G.Doc

class HttpGetProvider with ChangeNotifier {
  Map<String, dynamic> _dataRespon = {};

  Map<String, dynamic> get dataRespon {
    return _dataRespon;
  }

  Uri? url;

  void connectApi(String id, BuildContext context) async {
    url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse = await http.get(url!);

    if (hasilResponse.statusCode == 200) {
      var dataResponse =
          (json.decode(hasilResponse.body) as Map<String, dynamic>)["data"];

      _dataRespon = dataResponse;
      responseMessage(context, "Berhasil Mendapatkan data");
    } else {
      responseMessage(context, "Error ${hasilResponse.statusCode}");
    }

    notifyListeners();
  }

  void deleteApi(BuildContext context) async {
    var hasilResponse = await http.delete(url!);

    if (hasilResponse.statusCode == 204) {
      responseMessage(
          context, "Berhasil Menghapus, status: ${hasilResponse.statusCode}");

      _dataRespon = {};
      notifyListeners();
    }
  }

  responseMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        duration: Duration(milliseconds: 700),
      ),
    );
  }
}
