//! Done Model G.Doc
class KostModel {
  String name;
  String ImageURL;
  bool isFavorite;

  KostModel({
    required this.name,
    required this.ImageURL,
    this.isFavorite = false,
  });
}
