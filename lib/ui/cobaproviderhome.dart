//import 'dart:html';
//import 'dart:math';

//import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/ui/cobaproviderfavorite.dart';
//import 'package:modern_flutter_ui/models/providermodel.dart';
//import 'package:modern_flutter_ui/widget/providerwidget.dart';

import '../widget/providerwidgetgrid.dart';

class CobaProvider extends StatelessWidget {
  CobaProvider({Key? key}) : super(key: key);

  static const nameRoute = 'cobaprovider';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Provider"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CobaProviderFavorite.nameRoute);
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ProductGrid(),
          )
        ],
      ),
    );
  }
}
