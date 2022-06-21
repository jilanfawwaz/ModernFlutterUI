class Product {
  final String id;
  final String judul;
  final String deskripsi;
  final String imageURL;
  final int harga;
  bool isSelected;
  bool isCart;

  Product({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.imageURL,
    this.harga = 0,
    this.isSelected = false,
    this.isCart = false,
  });
}
