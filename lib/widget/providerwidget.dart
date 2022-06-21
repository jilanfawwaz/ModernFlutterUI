import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/models/providermodel.dart';
import 'package:modern_flutter_ui/ui/cobaproviderdetail.dart';

class ProviderWidget extends StatelessWidget {
  final Product listProduct;
  const ProviderWidget({required this.listProduct, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(listProduct.judul);
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
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
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
