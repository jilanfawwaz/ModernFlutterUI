import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/providerallproduct.dart';
import 'package:modern_flutter_ui/Providers/providercart.dart';
import 'package:modern_flutter_ui/shared/theme.dart';
import 'package:modern_flutter_ui/ui/cobaprovidercart.dart';
//import 'package:modern_flutter_ui/models/providermodel.dart';
import 'package:provider/provider.dart';

import '../widget/providerbadge.dart';
//! Done Pages G.Doc

class CobaProviderDetail extends StatelessWidget {
  CobaProviderDetail({Key? key}) : super(key: key);

  static const nameRoute = '/cobaproviderdetail';

  @override
  Widget build(BuildContext context) {
    final String productID =
        ModalRoute.of(context)?.settings.arguments as String;

    final _productData =
        Provider.of<AllProduct>(context).getProductById(productID);
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Produk"),
        actions: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                //NOTE:VisualDensity
                //minimal -4, maksimal 4
                visualDensity: VisualDensity(
                  horizontal: -4.0,
                  //vertical: -4.0,
                ),
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(Icons.favorite),
              ),
              Consumer<Cart>(
                builder: (context, cart, child) {
                  //NOTE: Badge
                  return Badge(
                    child: IconButton(
                        visualDensity: VisualDensity(
                          horizontal: -1.0,
                          //vertical: 0.0,
                        ),
                        //padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, CobaProviderCart.nameRoute);
                        },
                        icon: Icon(Icons.shopping_cart)),
                    value: cart.getJumlah.toString(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 200,
                width: 200,
                /*decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      _productData.imageURL,
                    ),
                  ),
                ),*/

                //child: _productData.imageURL,

                // child: Image.network(
                //   _productData.imageURL,
                //   fit: BoxFit.cover,
                // ),

                /*child: Image.network(
                  _productData.imageURL,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      width: 30,
                      height: 30,
                      color: Colors.amber,
                    );
                  },
                ),*/

                child: FadeInImage(
                  //NOTE:Curves animation
                  fadeInCurve: Curves.easeInCirc,
                  image: NetworkImage(
                    _productData.imageURL,
                    //scale: 0.1,
                  ),
                  placeholder: AssetImage("assets/images/4-gambarBelanja.png"),
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    print(error); //do something
                    return Text("EROR MASBRO");
                  },
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "${_productData.judul}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: extraBold),
            ),
            Text("Anda memilih produk dengan id: ${_productData.id}"),
            Text(
              "${_productData.deskripsi}",
              textAlign: TextAlign.center,
            ),
            Text("Harga : Rp.${_productData.harga}"),
            SizedBox(
              height: 20,
            ),

            //NOTE:OutlinedButton
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.red, width: 2),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(microseconds: 500),
                    backgroundColor: Colors.blue.withOpacity(0.8),
                    content: Text(
                      "Barang Telah Ditambahkan ke Cart",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
                cart.addCart(
                    _productData.id, _productData.judul, _productData.harga);
              },
              child: Text(
                "ADD TO CART",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
