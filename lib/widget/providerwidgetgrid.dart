import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/providerallproduct.dart';
import 'package:modern_flutter_ui/widget/providerwidgetcard.dart';
import 'package:provider/provider.dart';

import '../Providers/providermodel.dart';
//! Done Widget G.Doc

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _listProduct = Provider.of<AllProduct>(context).allProduct;

    return GridView.builder(
      padding: EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        //childAspectRatio: 1 / 1, //secara default 1 / 1
      ),
      itemCount: _listProduct.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: _listProduct[index],

          //kalau return adalah value bukan class, jangan membuat context baru, usahakan pake context value yang udah ada aja
          //create: (context) => _listProduct[index],
          child: ProviderWidget(),
        );
      },
    );
  }
}
