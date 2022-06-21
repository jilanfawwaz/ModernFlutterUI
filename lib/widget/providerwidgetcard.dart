import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/providerallproduct.dart';
import 'package:modern_flutter_ui/models/providermodel.dart';
import 'package:modern_flutter_ui/ui/cobaproviderdetail.dart';
import 'package:provider/provider.dart';

class ProviderWidget extends StatefulWidget {
  final Product listProduct;
  const ProviderWidget({required this.listProduct, Key? key}) : super(key: key);

  @override
  State<ProviderWidget> createState() => _ProviderWidgetState();
}

class _ProviderWidgetState extends State<ProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.listProduct.judul);
        Navigator.pushNamed(
          context,
          CobaProviderDetail.nameRoute,
          arguments: widget.listProduct.id,
        );
      },
      //NOTE: ClipRRect
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        //NOTE:GridTile
        child: GridTile(
          child: Image.network(
            widget.listProduct.imageURL,
            fit: BoxFit.cover,
          ),
          footer:
              //NOTE:GridTileBar
              GridTileBar(
            backgroundColor: Colors.blue.withOpacity(0.8),
            leading: IconButton(
              onPressed: () {
                setState(() {
                  Provider.of<AllProduct>(context, listen: false)
                      .addFavorite(widget.listProduct.id);
                });
              },
              icon: !widget.listProduct.isSelected
                  ? Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
            ),
            title: Text(
              widget.listProduct.judul,
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
