//import 'dart:html';
import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/models/providermodel.dart';
import 'package:modern_flutter_ui/widget/providerwidget.dart';

class CobaProvider extends StatelessWidget {
  CobaProvider({Key? key}) : super(key: key);

  static const nameRoute = 'cobaprovider';

  final List<Product> _listProduct = List.generate(
    30,
    (index) {
      return Product(
        id: "id_${index + 1}",
        judul: "Produk ${index + 1}",
        deskripsi: Faker().food.restaurant(),
        imageURL: "https://picsum.photos/id/${index + 30}/200/300",
        harga: 10000 + Random().nextInt(50000),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Coba Provider"),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  //childAspectRatio: 1 / 1, //secara default 1 / 1
                ),
                itemCount: _listProduct.length,
                itemBuilder: (context, index) {
                  return ProviderWidget(listProduct: _listProduct[index]);
                },
              ),
            )
          ],
        ));
  }
}
