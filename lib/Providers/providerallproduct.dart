import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/providermodel.dart';

class AllProduct with ChangeNotifier {
  final List<Product> _allProduct = List.generate(
    30,
    (index) {
      String name = Faker().food.restaurant();
      return Product(
        id: "id_${index + 1}",
        judul: name,
        deskripsi: "Anda memilih produk dengan nama $name",
        imageURL: "https://picsum.photos/id/${index + 30}/200/300",
        harga: 10000 + Random().nextInt(50000),
      );
    },
  );

  List<Product> get allProduct {
    //method getter
    return [..._allProduct];
    //ekstrak list (- ... boleh dihapus, tapi allProduct dikeluarkan dari kurung siku)
  }

  List<Product> get favoriteProduct {
    return _allProduct.where((element) => element.isSelected == true).toList();
  }

  Product getProductById(productId) {
    return _allProduct.firstWhere((element) {
      return element.id == productId;
    });
  }


  // yang ini ditaroh di provider model aja
  /*void addFavorite(productId) {
    int indexProduct = _allProduct.indexOf(_allProduct.firstWhere((element) {
      return element.id == productId;
    }));

    _allProduct[indexProduct].isSelected =
        !_allProduct[indexProduct].isSelected;

    notifyListeners();
  }*/
}
