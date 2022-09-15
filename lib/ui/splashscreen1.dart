import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    /*Timer(Duration(seconds: 1),
        () => Navigator.pushNamed(context, '/halamanutama1'));*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 140,
                height: 140,
                margin: EdgeInsets.only(bottom: 170),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/1-logoPedang.png"),
                  ),
                ),
              ),
              //Image.asset("assets/images/1-logoPedang.png"),
              Text(
                "VENTURE",
                style: cSerifWhiteRegular32.copyWith(
                  letterSpacing: 8.32,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
