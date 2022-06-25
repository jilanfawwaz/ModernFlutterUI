import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/providercartitem.dart';

class Cart with ChangeNotifier {
  final Map<String, CartItem> _cart = {};

  //NOTE:Getter
  //getter itu mereturn sesuatu, bukan diinisialisasi
  //static int nilaiAwal = 8;

  Map<String, CartItem> get getCart {
    return _cart;
  }

  int get getJumlah {
    return _cart.length;
  }

  int get getTotalHarga {
    //key adalah iterator nya, value adalah isi dari key nya (object CartItem)
    int total = 0;
    _cart.forEach((key, value) {
      total += value.qty * value.price;
    });

    return total;
  }

  void addQuantity(String productID) {
    _cart.update(
      productID,
      (value) => CartItem(
        //id, judul, price tetap make data yang lama, yang diupdate cuma jumlahnya aja
        id: value.id,

        judul: value.judul,
        price: value.price,
        qty: value.qty + 1,
      ),
    );
    notifyListeners();
  }

  void removeQuantity(String productID) {
    // '?' buat apa
    if (_cart[productID.toString()]?.qty == 1) {
      _cart.remove(productID);
    } else {
      _cart.update(
        productID,
        (value) => CartItem(
          //id, judul, price tetap make data yang lama, yang diupdate cuma jumlahnya aja
          id: value.id,

          judul: value.judul,
          price: value.price,
          qty: value.qty + -1,
        ),
      );
    }

    notifyListeners();
  }

  void addCart(String productID, String judul, int price) {
    //apabila tidak ada KEY yang bernama sama dengan product id
    if (!_cart.containsKey(productID)) {
      //pitIfAbsent artinya buat baru di dalam map itu ada ga productId yang isinya CartItem, kalau gaada ya cartItem nya diinject ke key productId itu
      _cart.putIfAbsent(
        productID,
        () {
          return CartItem(
            id: DateTime.now().toString(),
            judul: judul,
            price: price,
            qty: 1,
          );
        },
      );
    } else {
      //kalau ternyata key udah terdaftar di map, maka key itu akan diupdate
      _cart.update(
        productID,
        (value) => CartItem(
          //id, judul, price tetap make data yang lama, yang diupdate cuma jumlahnya aja
          id: value.id,

          judul: value.judul,
          price: value.price,
          qty: value.qty + 1,
        ),
      );
    }

    //jangan lupa kasih notify biar update dari map ke listen
    notifyListeners();
  }
}
