import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/widget/providerbadge.dart';
import 'package:provider/provider.dart';

import '../Providers/providerallproduct.dart';
import '../widget/providerwidgetcard.dart';
//! Done Pages G.Doc

class CobaProviderFavorite extends StatelessWidget {
  const CobaProviderFavorite({Key? key}) : super(key: key);

  static const nameRoute = 'cobaproviderfavorite';

  @override
  Widget build(BuildContext context) {
    final _listProduct = Provider.of<AllProduct>(context).favoriteProduct;
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Favorite"),
        actions: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite),
              ),
              Badge(
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.shopping_cart)),
                value: "0",
              ),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _listProduct.length == 0
              ? Center(
                  child: Text("Anda Tidak memiliki produk favorite"),
                )
              : Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(5),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      //childAspectRatio: 1 / 1, //secara default 1 / 1
                    ),
                    itemCount: _listProduct.length,
                    itemBuilder: (context, index) {
                      //NOTE:ChangeNotifierProvider.value , kalau nggak menggunakan multiProvider di main.dart, maka harus masukkan manual ke setiap child widget tree yang membutuhkan provider
                      return ChangeNotifierProvider.value(
                          value: _listProduct[index], child: ProviderWidget());
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
