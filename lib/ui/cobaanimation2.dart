import 'package:flutter/material.dart';

//! halaman TUjuan widget Hero
class CobaAnimationNavigator extends StatelessWidget {
  const CobaAnimationNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String argument = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Coba Animation'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: argument,
            child: Image.network(
              "https://picsum.photos/id/${argument}/200/300",
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
