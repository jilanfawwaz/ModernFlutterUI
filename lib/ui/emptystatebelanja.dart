import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';
//! Done Screen G.Doc

class EmptyBelanja extends StatelessWidget {
  const EmptyBelanja({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 240,
                height: 210,
                margin: EdgeInsets.only(
                  top: 148,
                  bottom: 100,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/4-gambarBelanja.png"),
                  ),
                ),
              ),
              Text(
                "Success Order",
                style: cPoppinsWhiteSemibold24.copyWith(
                  color: Color(0xff0E1954),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "We will delivery your package\nas soon as possible",
                style: cPoppinsGreyRegular14.copyWith(
                  fontSize: 16,
                  color: Color(0xff0E1954),
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 200,
                height: 55,
                margin: EdgeInsets.only(
                  top: 50,
                ),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: cPinkButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: Text(
                    "Done",
                    style: cOpenSansGreySemibold18.copyWith(
                      color: Color(0xffF8F8F8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
