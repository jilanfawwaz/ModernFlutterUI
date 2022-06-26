import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpGetStateful {
  String? id, name, email, imageURL;

  HttpGetStateful({
    this.id,
    this.name,
    this.email,
    this.imageURL,
  });

  static Future<HttpGetStateful> connectApi(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse = await http.get(url);

    var dataResponse = json.decode(hasilResponse.body)["data"];

    return HttpGetStateful(
      id: dataResponse["id"].toString(),
      name: dataResponse["first_name"] + " " + dataResponse["last_name"],
      email: dataResponse["email"],
      imageURL: dataResponse["avatar"],
    );
  }
}
