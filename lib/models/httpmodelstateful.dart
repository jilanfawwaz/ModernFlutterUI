import 'dart:convert';

import 'package:http/http.dart' as http;
//! Done Model G.Doc

class HttpModelStateful {
  String? name;
  String? job;
  String? id;
  String? createdAt;

  HttpModelStateful({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  static Future<HttpModelStateful> connectApi(String name, String job) async {
    //harus static biar bisa dipanggil di class lain
    Uri url = Uri.parse("https://reqres.in/api/users");

    var hasilResponse = await http.post(
      //melakukan request ke server api, kemudian menunggu untuk mendapatkan response
      url,
      body: {
        //apa yang mau diupload ke server api
        "name": name,
        "job": job,
      },
    );

    var dataResponse = json.decode(hasilResponse.body);

    return HttpModelStateful(
      id: dataResponse["id"],
      name: dataResponse["name"],
      job: dataResponse["job"],
      createdAt: dataResponse["createdAt"],
    );
  }
}
