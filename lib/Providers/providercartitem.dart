import 'package:flutter/material.dart';
//! Done Provider G.Doc

class CartItem with ChangeNotifier {
  final String id;
  final String judul;
  final int qty;
  final int price;

  CartItem({
    required this.id,
    required this.judul,
    this.qty = 0,
    this.price = 0,
  });
}
