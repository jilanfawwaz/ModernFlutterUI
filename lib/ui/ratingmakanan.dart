import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';
//! Done Screen G.Doc

class RatingMakanan extends StatelessWidget {
  const RatingMakanan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181925),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 37,
          ),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.only(
                    top: 80,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/5-gambarProfil.png"),
                    ),
                  ),
                ),
                Text(
                  "Pizza Ballado",
                  style: cPoppinsWhiteSemibold24,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  r"$90,00",
                  style: cPoppinsWhiteRegular16.copyWith(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Was it delicious?",
                      style: cPoppinsWhiteMedium18,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      //color: Color(0xff37394D),
                      decoration: BoxDecoration(
                        color: Color(0xff37394D),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "😡",
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      //color: Color(0xff37394D),
                      decoration: BoxDecoration(
                        color: Color(0xff37394D),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "😔",
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      //color: Color(0xff37394D),
                      decoration: BoxDecoration(
                        color: Color(0xffEEF0FF),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "😁",
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      //color: Color(0xff37394D),
                      decoration: BoxDecoration(
                        color: Color(0xff37394D),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "😍",
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 211,
                  height: 55,
                  //color: Color(0xff34D186),
                  margin: EdgeInsets.only(top: 90),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff34D186),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Rate Now",
                      style: cPoppinsWhiteSemibold24.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
