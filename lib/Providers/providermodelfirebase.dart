import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//! Done Provider G.Doc

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

  Map<String, dynamic> getProductById(String id) {
    return _data.firstWhere((element) => element["id"] == id);
  }

  Future<void> patchApi(
      {String? id, String? name, String? imageURL, String? job}) async {
    Uri url = Uri.parse(
        "https://http-req-a092b-default-rtdb.firebaseio.com/users/$id/.json");
    //tanda slash '/' setelah id boleh dihapus

    await http
        .patch(
      url,
      body: json.encode(
        {"name": name, "imageURL": imageURL, "job": job},
      ),
    )
        .then((_) {
      _data.firstWhere((element) => element["id"] == id)["name"] = name;
      _data.firstWhere((element) => element["id"] == id)["job"] = job;
      _data.firstWhere((element) => element["id"] == id)["imageURL"] = imageURL;
      //TIPS:mengosongkan map
      // _data.clear();
      // ProviderFirebase().getApi();
    });
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> getApiFutureBuilder() async {
    try {
      Uri url = Uri.parse(
          "https://http-req-a092b-default-rtdb.firebaseio.com/users.json");

      var hasilResponse = await http.get(url);

      if (hasilResponse.statusCode >= 200 && hasilResponse.statusCode < 300) {
        if (json.decode(hasilResponse.body) != null) {
          var dataResponse =
              json.decode(hasilResponse.body) as Map<String, dynamic>;

          //List<Map<String, dynamic>> dataFutureBuilder = [];

          dataResponse.forEach(
            (key, value) {
              _data.add(
                {
                  "id": key.toString(),
                  "name": value["name"],
                  "job": value["job"],
                  "createdAt": value["createdAt"],
                  "imageURL": value["imageURL"],
                },
              );
            },
          );

          //NOTE:MAP .map()
          List<Map<String, dynamic>> dataFutureBuilder =
              dataResponse.entries.map<Map<String, dynamic>>((e) {
            //entries itu menampilkan key dan value sekaligus dalam satu data
            return {
              "id": e.key,
              "name": e.value["name"],
              "job": e.value["job"],
              "createdAt": e.value["createdAt"],
              "imageURL": e.value["imageURL"],
            };
          }).toList();

          //kalo FutureBuilder gaperlu make notifyListener lagi
          //notifyListeners();
          return dataFutureBuilder;
        }
        return [];
      } else {
        print('Masuk eror');
        print(hasilResponse.body);
        //throw Exception("Eror kodess ${hasilResponse.statusCode}");
        throw (hasilResponse.statusCode);
      }
    } catch (err) {
      //print(err);
      //rethrow;
      throw (err);
    }
  }

  //Future<void> getApi() async {
  getApi() async {
    //gaada try catch
    Uri url = Uri.parse(
        "https://http-req-a092b-default-rtdb.firebaseio.com/users.json");

    var hasilResponse = await http.get(url);

    if (json.decode(hasilResponse.body) != null) {
      // if (hasilResponse.body != null) {
      var dataResponse =
          json.decode(hasilResponse.body) as Map<String, dynamic>;

      // print(hasilResponse.body);

      // print(hasilResponse.statusCode);

      // print("KEY ====");
      // print(dataResponse.length);

      dataResponse.forEach(
        (key, value) {
          _data.add(
            {
              "id": key.toString(),
              "name": value["name"],
              "job": value["job"],
              "createdAt": value["createdAt"],
              "imageURL": value["imageURL"],
            },
          );
        },
      );

      /*for (var item in dataResponse.entries.toList()) {
        // print(item.key);
        // print(item.value);
        _data.add({
          "id": item.key.toString(),
          "name": item.value["name"],
          "job": item.value["job"],
          "createdAt": item.value["createdAt"],
          "imageURL": item.value["imageURL"],
        });
      }*/

      /*for (var i = 0; i < dataResponse.length; i++) {
        _data.add({
          "id": dataResponse.keys.toList()[i].toString(),
          "name": dataResponse.values.toList()[i]["name"],
          "job": dataResponse.values.toList()[i]["job"],
          "createdAt": dataResponse.values.toList()[i]["createdAt"],
          "imageURL": dataResponse.values.toList()[i]["imageURL"],
        });
      }*/
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

  connectApi(
      {String? name,
      String? job,
      String? imageURL,
      DateTime? createdAt}) async {
    try {
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

          //kalau hasil dari http post respon statusnya bukan 200, maka akan throw eror
          if (value.statusCode >= 200 && value.statusCode < 300) {
            _data.add(
              {
                "id": json.decode(value.body)["name"],
                "name": name,
                "job": job,
                "imageURL": imageURL,
                "createdAt": createdAt.toString(),
              },
            );
          } else {
            throw value.statusCode.toString();
          }
        },
      );
    } catch (e) {
      rethrow;
    }

    //print("masuks");
    //print(_data[_data.length - 1]["name"]);
    notifyListeners();
  }
}
