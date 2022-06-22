import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/providerallproduct.dart';
import 'package:modern_flutter_ui/Providers/providermodel.dart';
import 'package:modern_flutter_ui/ui/cobaproviderdetail.dart';
import 'package:provider/provider.dart';

class ProviderWidget extends StatefulWidget {
  @override
  State<ProviderWidget> createState() => _ProviderWidgetState();
}

class _ProviderWidgetState extends State<ProviderWidget> {
  @override
  Widget build(BuildContext context) {
    final listProduct = Provider.of<Product>(context);
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
          child: Image.network(
            listProduct.imageURL,
            fit: BoxFit.cover,
          ),
          footer:
              //NOTE:GridTileBar
              GridTileBar(
            backgroundColor: Colors.blue.withOpacity(0.8),
            leading: IconButton(
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
            ),
            title: Text(
              listProduct.judul,
              style: TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: () {},
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
