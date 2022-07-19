import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CobaAuthenticationLoginProvider with ChangeNotifier {
  //Autehtication Token Handling, User id Handling, dll

  Timer? _authTimer;

  String? _idToken, _localId;
  DateTime? _expireDate;

  String? get localId {
    return _localId;
  }

  bool get isAuth {
    return idToken != null;
  }

  String? get idToken {
    if (_idToken != null &&
        _expireDate != null &&
        _expireDate!.isAfter(DateTime.now())) {
      return _idToken;
    }
    return null;
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

      //print('idToken : ${dataRespon['idToken']}');
      //print('localId : ${dataRespon['localId']}');
      if (dataRespon['error'] != null) {
        throw dataRespon['error']['message'];
      }
      _idToken = dataRespon['idToken'];
      _expireDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            dataRespon['expiresIn'],
          ),
        ),
      );
      _autoLogout();

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

      //print('idToken : ${dataRespon['idToken']}');
      // print('localId : ${dataRespon['localId']}');

      _idToken = dataRespon['idToken'];
      _localId = dataRespon['localId'];
      _expireDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            dataRespon['expiresIn'],
          ),
        ),
      );

      _autoLogout();

      print('expiresIn : ${dataRespon['expiresIn']}');
      print('_expireDate : $_expireDate');
      print(
          'expiresDate.difference DateTime.now() : ${_expireDate?.difference(DateTime.now()).inSeconds}');
      if (dataRespon['error'] != null) {
        throw dataRespon['error']['message'];
      }

      notifyListeners();
    } catch (e) {
      rethrow;
    }

    notifyListeners();

    //print(hasilRespon.statusCode);
  }

  logOut() {
    _idToken = null;
    _localId = null;
    _expireDate = null;
    if (_authTimer != null) {
      _authTimer?.cancel();
      _authTimer = null;
    }
    notifyListeners();
  }

  _autoLogout() {
    if (_authTimer != null) {
      _authTimer?.cancel();
      _authTimer = null;
    }

    //NOTES:DateTime difference
    //bisa juga expireTime diinisialisasi langsung menggunaka expiresIn dari API
    final expireTime = _expireDate?.difference(DateTime.now()).inSeconds;

    //NOTES:Timer
    // _authTimer = Timer(duration, callback)
    _authTimer = Timer(Duration(seconds: expireTime!), logOut);
  }
}
