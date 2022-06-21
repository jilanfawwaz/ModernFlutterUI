import 'package:flutter/material.dart';

class CobaProviderDetail extends StatelessWidget {
  CobaProviderDetail({Key? key}) : super(key: key);

  static const nameRoute = '/cobaproviderdetail';

  @override
  Widget build(BuildContext context) {
    final String productID =
        ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Produk"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Anda memilih produk dengan id: $productID"),
          ],
        ),
      ),
    );
  }
}
