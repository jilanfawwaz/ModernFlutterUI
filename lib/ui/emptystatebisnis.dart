import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';

class EmptyBisnis extends StatelessWidget {
  const EmptyBisnis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B1B33),
      floatingActionButton: Container(
        width: 65,
        height: 65,
        margin: EdgeInsets.only(bottom: 40),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xff808EE0),
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/4-logoRoket.png"),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 454,
            margin: EdgeInsets.only(
              bottom: 68,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/4-gambarGrafik.png",
                ),
              ),
            ),
          ),
          Text(
            "Boost Profit!",
            style: cPoppinsWhiteSemibold24,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Our tools are helping business\nto grow much faster",
            style: cPoppinsWhiteLight16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
