import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/providerallproduct.dart';
import 'package:modern_flutter_ui/widget/providerwidget.dart';
import 'package:provider/provider.dart';

import '../models/providermodel.dart';

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
        return ProviderWidget(listProduct: _listProduct[index]);
      },
    );
  }
}
