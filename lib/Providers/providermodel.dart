import 'package:flutter/material.dart';
//! Done Provider G.Doc

class Product with ChangeNotifier {
  final String id;
  final String judul;
  final String deskripsi;
  //final Widget imageURL;
  final String imageURL;
  final int harga;
  bool isSelected; //isFavorite
  bool isCart;

  Product({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.imageURL,
    this.harga = 0,
    this.isSelected = false,
    this.isCart = false,
  });

  void setFavorite() {
    isSelected = !isSelected;
    notifyListeners();
  }
}
