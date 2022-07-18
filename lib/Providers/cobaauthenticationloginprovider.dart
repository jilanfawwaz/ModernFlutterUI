import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CobaAuthenticationLoginProvider with ChangeNotifier {
  //Autehtication Token Handling, User id Handling, dll

  String? _token;

  String? get token {
    return _token;
  }

  Future signUp({String? email, String? password}) async {
    //link didapat dari firebase API dokumentasi
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyB_A3h8FjK6WVRa1QwtIpvb4KHWUDlfmnc');

    try {
      var hasilRespon = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      var dataRespon = json.decode(hasilRespon.body);

      // if (hasilRespon.statusCode >= 200 && hasilRespon.statusCode < 300) {
      // } else {
      //   throw (hasilRespon.statusCode);
      // }

      print('idToken : ${dataRespon['idToken']}');
      print('localId : ${dataRespon['localId']}');
      if (dataRespon['error'] != null) {
        throw dataRespon['error']['message'];
      }
      _token = dataRespon['idToken'];
      notifyListeners();
    } catch (e) {
      rethrow;
      //throw e;
    }

    // print(hasilRespon.statusCode);
  }

  Future signIn({String? email, String? password}) async {
    //link didapat dari firebase API dokumentasi
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyB_A3h8FjK6WVRa1QwtIpvb4KHWUDlfmnc');

    try {
      var hasilRespon = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      var dataRespon = json.decode(hasilRespon.body);

      // if (hasilRespon.statusCode >= 200 && hasilRespon.statusCode < 300) {
      // } else {
      //   throw (hasilRespon.statusCode);
      // }

      print('idToken : ${dataRespon['idToken']}');
      print('localId : ${dataRespon['localId']}');

      if (dataRespon['error'] != null) {
        throw dataRespon['error']['message'];
      }
      _token = dataRespon['idToken'];
    } catch (e) {
      rethrow;
    }

    notifyListeners();

    //print(hasilRespon.statusCode);
  }
}
