import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/providermodel.dart';
//! Done Provider G.Doc

class AllProduct with ChangeNotifier {
  final List<Product> _allProduct = List.generate(
    30,
    (index) {
      String name = Faker().food.restaurant();
      return Product(
        id: "id_${index + 1}",
        judul: name,
        deskripsi: "Anda memilih produk dengan nama $name",

        //imageURL: 'https://image.tmdb.org/t/p/w92',
        imageURL: "https://picsum.photos/id/${index + 29}/200/300",

        /*imageURL: Image.network(
          'https://image.tmdb.org/t/p/w92',
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext ctx, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              );
            }
          },
        ),*/

        /*imageURL: CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w92',
          placeholder: (context, url) => Center(
              child: Container(
                  width: 20, height: 20, child: CircularProgressIndicator())),
          errorWidget: (context, url, error) {
            print(error);
            return Center(
              child: Icon(Icons.error),
            );
          },
          fit: BoxFit.cover,
        ),*/

        /*imageURL: FadeInImage(
            image: NetworkImage("https://picsum.photos/id/${index + 29}/200/300",),
            placeholder: AssetImage("assets/images/4-gambarBelanja.png"),
            fit: BoxFit.cover,
            imageErrorBuilder: (context, error, stackTrace) {
              print(error); //do something
              return Text("EROR MASBRO");
            },
          ),*/

        harga: 10000 + Random().nextInt(50000),
      );
    },
  );

  List<Product> get allProduct {
    //method getter
    return [..._allProduct];
    //NOTE:Titik Tiga untukekstrak list (- ... boleh dihapus, tapi allProduct dikeluarkan dari kurung siku/kurung siku juga dihapus)
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
