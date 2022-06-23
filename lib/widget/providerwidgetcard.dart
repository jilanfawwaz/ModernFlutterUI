import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/providerallproduct.dart';
import 'package:modern_flutter_ui/Providers/providercart.dart';
import 'package:modern_flutter_ui/Providers/providermodel.dart';
import 'package:modern_flutter_ui/ui/cobaproviderdetail.dart';
import 'package:provider/provider.dart';

class ProviderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listProduct = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    //print("Widger Rebuild");
    print("BUILD IMAGE");
    return GestureDetector(
      onTap: () {
        //print(listProduct.judul);
        Navigator.pushNamed(
          context,
          CobaProviderDetail.nameRoute,
          arguments: listProduct.id,
        );
      },
      //NOTE: ClipRRect
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        //NOTE:GridTile
        child: GridTile(
          //NOTE:FadeInImage (nunggu gambar network selesai ke load, maka akan ditampilkan gambar default dulu), tapi link dari gambar network harus selalu aktif biar ga eror
          /*child: FadeInImage(
            image: NetworkImage(listProduct.imageURL),
            placeholder: AssetImage("assets/images/4-gambarBelanja.png"),
            fit: BoxFit.cover,
            imageErrorBuilder: (context, error, stackTrace) {
              print(error); //do something
              return Text("EROR MASBRO");
            },
          ),*/
          //END:FadeInImage

          //NOTE:ErrorBuilder
          /*child: Image.network(
            'https://example.does.not.exist/image.jpg',
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              // Appropriate logging or analytics, e.g.
              // myAnalytics.recordError(
              //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
              //   exception,
              //   stackTrace,
              // );
              print(exception);
              return Center(
                child: const Text('test'),
              );
            },
          ),*/
          //END:ErrorBuilder

          //NOTE:ChacedNetworkImage //BERFUNGSI!!! untuk menaruh gambar di chache, ketika internet mati gambar masih bisa ditampilkan, lebih baik widget ini ditaroh ketika fetching data
          child: CachedNetworkImage(
            imageUrl: listProduct.imageURL,
            placeholder: (context, url) => Center(
                child: Container(
                    height: 20, width: 20, child: CircularProgressIndicator())),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
          ),
          //END:CachedNetworkImage

          /*child: Image.network(
            listProduct.imageURL,
            errorBuilder: (context, error, stackTrace) {
              print(error); //do something
              return Text("EROR MASBRO");
            },
            fit: BoxFit.cover,
          ),*/

          //child: listProduct.imageURL, //berisi widget CachedNetworkImage

          footer:
              //NOTE:GridTileBar
              GridTileBar(
            backgroundColor: Colors.blue.withOpacity(0.8),
            leading: Consumer<Product>(builder: (context, listProduct, child) {
              //print("product favorite");
              return IconButton(
                onPressed: () {
                  listProduct.setFavorite();
                  //manggil provider cukup satu kali aja dalam satu context
                  //Provider.of<Product>(context).isSelected;
                },
                icon: !listProduct.isSelected
                    ? Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
              );
            }),
            title: Text(
              listProduct.judul,
              style: TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            //icon cart ini gaperlu dikasih consumer, karena gaada tampilan yang harus dirender ulang di bagian ini
            trailing: IconButton(
              onPressed: () {
                //NOTE:ScaffoldMessenger SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(microseconds: 500),
                    backgroundColor: Colors.blue.withOpacity(0.8),
                    content: Text(
                      "Barang Telah Ditambahkan",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
                cart.addCart(
                    listProduct.id, listProduct.judul, listProduct.harga);
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ),

          /*Container(
            color: Colors.blue.withOpacity(0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
                Text(
                  listProduct.judul,
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),*/
        ),
      ),
    );
  }
}
