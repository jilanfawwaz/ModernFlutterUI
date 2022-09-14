import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//! Done Widget G.Doc

class ProfileImage extends StatelessWidget {
  final String imageURL;
  const ProfileImage({
    required this.imageURL,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageURL,
        placeholder: (context, url) =>
            Image.asset("assets/images/noImage.jpeg"),
        errorWidget: (context, url, error) => Icon(Icons.error),
        
      );
    } catch (e) {
      rethrow;
    }
  }
}
