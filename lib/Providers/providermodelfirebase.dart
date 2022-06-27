import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderFirebase with ChangeNotifier {
  final List<Map<String, dynamic>> _data = [];

  List<Map<String, dynamic>> get data {
    return _data;
  }

  int get getJumlah {
    return _data.length;
  }

  Future<void> deleteApi(String id) async {
    Uri url = Uri.parse(
        "https://http-req-a092b-default-rtdb.firebaseio.com/users/$id.json");

    await http.delete(url).then(
          (value) => _data.removeWhere((element) => element["id"] == id),
        );
    notifyListeners();
    //print(_data);
  }

  void getApi() async {
    Uri url = Uri.parse(
        "https://http-req-a092b-default-rtdb.firebaseio.com/users.json");

    var hasilResponse = await http.get(url);

    if (hasilResponse.body != null) {
      var dataResponse =
          json.decode(hasilResponse.body) as Map<String, dynamic>;

      print(hasilResponse.body);

      print(hasilResponse.statusCode);

      // print("KEY ====");
      // print(dataResponse.length);

      for (var i = 0; i < dataResponse.length; i++) {
        _data.add({
          "id": dataResponse.keys.toList()[i].toString(),
          "name": dataResponse.values.toList()[i]["name"],
          "job": dataResponse.values.toList()[i]["job"],
          "createdAt": dataResponse.values.toList()[i]["createdAt"],
          "imageURL": dataResponse.values.toList()[i]["imageURL"],
        });
      }
    }

    notifyListeners();

    // print("VALUES ====");
    // print(dataResponse.values.toList());

    //print(dataResponse[1]);

    //print(dataResponse[dataResponse.keys.toList()[1].toString()]["name"]);

    //_data.addAll([dataResponse.map((key, value) => {"id": key.toString(), "name": value["name"].toString()})]);

    // dataResponse.map((e) {
    //   return print(e["name"]);
    // });

    //print(dataResponse.keys.toList());

    //_data = dataResponse;
  }

  Future<void> connectApi(
      {String? name,
      String? job,
      String? imageURL,
      DateTime? createdAt}) async {
    Uri url = Uri.parse(
        "https://http-req-a092b-default-rtdb.firebaseio.com/users.json");

    await http
        .post(
      url,
      body: json.encode(
        {
          "name": name,
          "job": job,
          "imageURL": imageURL,
          "createdAt": createdAt.toString(),
        },
      ),
    )
        .then(
      (value) {
        //print(json.decode(value.body));
        //mau make return boleh mau ngga juga gapapa
        _data.add(
          {
            "id": json.decode(value.body)["name"],
            "name": name,
            "job": job,
            "imageURL": imageURL,
            "createdAt": createdAt.toString(),
          },
        );
      },
    );

    //print("masuks");
    //print(_data[_data.length - 1]["name"]);
    notifyListeners();
  }
}
