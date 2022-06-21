import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/providerallproduct.dart';
import 'package:modern_flutter_ui/shared/theme.dart';
//import 'package:modern_flutter_ui/models/providermodel.dart';
import 'package:provider/provider.dart';

class CobaProviderDetail extends StatelessWidget {
  CobaProviderDetail({Key? key}) : super(key: key);

  static const nameRoute = '/cobaproviderdetail';

  @override
  Widget build(BuildContext context) {
    final String productID =
        ModalRoute.of(context)?.settings.arguments as String;

    final _productData =
        Provider.of<AllProduct>(context).getProductById(productID);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Produk"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    _productData.imageURL,
                  ),
                ),
              ),
              // child: Image.network(
              //   _productData.imageURL,
              //   fit: BoxFit.cover,
              // ),
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
          ],
        ),
      ),
    );
  }
}
