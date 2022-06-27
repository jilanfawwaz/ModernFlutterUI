//import 'dart:html';
//import 'dart:math';

//import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/providercart.dart';
import 'package:modern_flutter_ui/ui/cobaprovidercart.dart';
import 'package:modern_flutter_ui/ui/cobaproviderfavorite.dart';
import 'package:provider/provider.dart';
//import 'package:modern_flutter_ui/models/providermodel.dart';
//import 'package:modern_flutter_ui/widget/providerwidget.dart';

import '../widget/providerbadge.dart';
import '../widget/providerwidgetgrid.dart';

class CobaProvider extends StatelessWidget {
  CobaProvider({Key? key}) : super(key: key);

  static const nameRoute = 'cobaprovider';

  @override
  Widget build(BuildContext context) {
    //print("BUILD IMAGE");
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Provider"),
        //titleSpacing: 0,
        actions: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                //NOTE:VisualDensity
                //minimal -4, maksimal 4, berfungsi untuk merapatkan baris supaya lebih mepet

                visualDensity: VisualDensity(
                  horizontal: -4.0,
                  //vertical: -4.0,
                ),
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(Icons.favorite),
              ),
              //kalo udah pake consumer, boleh ko gausah make provider.of(context) lagi
              Consumer<Cart>(
                builder: (context, cart, child) {
                  return Badge(
                    child: IconButton(
                        visualDensity: VisualDensity(
                          horizontal: -1.0,
                          //vertical: 0.0,
                        ),
                        //padding: EdgeInsets.zero,
                        onPressed: () {Navigator.pushNamed(context, CobaProviderCart.nameRoute);},
                        icon: Icon(Icons.shopping_cart)),
                    value: cart.getJumlah.toString(),
                  );
                },
              ),
            ],
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
