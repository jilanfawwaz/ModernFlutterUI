import 'package:flutter/material.dart';

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

          /*Hero(
            tag: argument,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  //fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://picsum.photos/id/${argument}/200/300"),
                ),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
