import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';
//! Done Screen G.Doc

class GetStartedCrypto extends StatelessWidget {
  const GetStartedCrypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 80,
        height: 80,
        margin: EdgeInsets.only(bottom: 30),
        //default margin bottom float button adalah 25
        child: FloatingActionButton.large(
          onPressed: () {},
          backgroundColor: Color(0xff877BFB),
          child: Container(
            width: 34,
            height: 34,
            //margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/2-logoLogin.png"),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/2-background.png"),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Maximize Revenue",
                  style: cPoppinsWhiteSemibold24,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Gain more profit from cryptocurrency\nwithout any risk involved",
                  style: cPoppinsWhiteRegular16,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 185,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
