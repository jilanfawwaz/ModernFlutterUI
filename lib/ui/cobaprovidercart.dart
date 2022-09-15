import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/providercart.dart';
//! Done Screen G.Doc
//! Done Pages G.Doc

class CobaProviderCart extends StatelessWidget {
  const CobaProviderCart({Key? key}) : super(key: key);

  static const nameRoute = '/cobaprovidercart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Provider Cart"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Consumer<Cart>(
            builder: ((context, cart, child) {
              return cart.getJumlah == 0
                  ? Expanded(
                      child: Center(
                        child:
                            Text("Anda belum memasukkan barang apapun ke cart"),
                      ),
                    )
                  : Expanded(
                      child: ListView.separated(
                        itemCount: cart.getJumlah,
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                        itemBuilder: (context, index) {
                          return ListTile(
                            title:
                                Text(cart.getCart.values.toList()[index].judul),
                            subtitle: Column(
                              //mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Jumlah :${cart.getCart.values.toList()[index].qty} pcs"),
                                Text(
                                    "Harga Satuan : Rp.${cart.getCart.values.toList()[index].price}"),
                                Container(
                                  //width: 75,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          cart.removeQuantity(cart.getCart.keys
                                              .toList()[index]);
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          size: 20,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          cart.addQuantity(cart.getCart.keys
                                              .toList()[index]);
                                        },
                                        child: Icon(
                                          Icons.add,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            trailing: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              //color: Colors.amber,
                              child: Column(
                                children: [
                                  Text("Total"),
                                  Text(
                                      "Rp.${(cart.getCart.values.toList()[index].price * cart.getCart.values.toList()[index].qty).toString()}"),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
            }),
          ),
          Consumer<Cart>(
            builder: (context, cart, child) {
              return Center(
                child: Card(
                  margin: EdgeInsets.all(20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text("Rp. ${cart.getTotalHarga.toString()}"),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
