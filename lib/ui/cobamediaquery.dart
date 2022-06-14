import 'package:flutter/material.dart';

class CobaMediaQuery extends StatelessWidget {
  const CobaMediaQuery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: _height * 0.5,
                width: _width * 0.5,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
