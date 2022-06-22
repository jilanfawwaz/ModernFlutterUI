import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/providerallproduct.dart';
import '../widget/providerwidgetcard.dart';

class CobaProviderFavorite extends StatelessWidget {
  const CobaProviderFavorite({Key? key}) : super(key: key);

  static const nameRoute = 'cobaproviderfavorite';

  @override
  Widget build(BuildContext context) {
    final _listProduct = Provider.of<AllProduct>(context).favoriteProduct;
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Favorite"),
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
