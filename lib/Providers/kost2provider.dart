import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/models/kost2model.dart';
import 'package:modern_flutter_ui/models/kost2modelkedua.dart';

class KostProvider with ChangeNotifier {
  List<KostModel> _dataCity = [
    KostModel(
      name: 'Jakartaaaaaaaaaa',
      ImageURL: 'assets/images/kost2city1.png',
    ),
    KostModel(
        name: 'Bandung',
        ImageURL: 'assets/images/kost2city2.png',
        isFavorite: true),
    KostModel(
      name: 'Surabaya',
      ImageURL: 'assets/images/kost2city3.png',
    ),
    KostModel(
      name: 'Jakartaaaaaaaaaa',
      ImageURL: 'assets/images/kost2city1.png',
      isFavorite: true,
    ),
  ];

  List<KostModel> get dataCity {
    return _dataCity;
  }

  List<KostModelKedua> _dataSpace = [
    KostModelKedua(
      name: 'Kuratakeso Hott',
      ImageURL: 'assets/images/kost2city4.png',
      price: 52,
      location: 'Bandung, Germany',
      rating: 4,
    ),
    KostModelKedua(
      name: 'Roemah Nenek',
      ImageURL: 'assets/images/kost2city5.png',
      price: 11,
      location: 'Seattle, Bogor',
      rating: 5,
    ),
    KostModelKedua(
      name: 'Darrling How',
      ImageURL: 'assets/images/kost2city6.png',
      price: 20,
      location: 'Jakarta, Indonesia',
      rating: 3,
    ),
  ];

  List<KostModelKedua> get dataSpace {
    return _dataSpace;
  }
}
