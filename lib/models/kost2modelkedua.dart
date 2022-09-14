import 'package:flutter/material.dart';
//! Done Model G.Doc
class KostModelKedua with ChangeNotifier {
  final String name;
  final String ImageURL;
  final int price;
  final int rating;
  final String location;

  KostModelKedua({
    required this.name,
    required this.ImageURL,
    required this.price,
    required this.location,
    this.rating = 0,
  });
}
