import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';
//! Done Screen G.Doc

class HalamanUtama1 extends StatelessWidget {
  const HalamanUtama1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/1-background.png"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 51,
                  height: 51,
                  margin: EdgeInsets.only(right: 13.6),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/1-logoRumah.png"),
                    ),
                  ),
                ),
                Text(
                  "HouseQu",
                  style: cMontserratBlackBold32,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
