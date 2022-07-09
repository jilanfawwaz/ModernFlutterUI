import 'package:flutter/material.dart';

class CobaCheckboxModel with ChangeNotifier {
  final String id;
  final String title;
  bool isSelected;

  CobaCheckboxModel({
    required this.id,
    required this.title,
    this.isSelected = false,
  });
}
