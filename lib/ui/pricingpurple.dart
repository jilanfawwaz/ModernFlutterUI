import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';
//! Done Screen G.Doc

class PricingPurple extends StatelessWidget {
  const PricingPurple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff0B073E),
                  Color(0xff602880),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 50),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 164,
                    height: 164,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 24,
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/6-logoNota2.png"))),
                  ),
                  Text(
                    "Pro Features",
                    style: cPoppinsWhiteSemibold24.copyWith(
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Unlock the winner modules\nand get more insights",
                    style: cPoppinsWhiteRegular16.copyWith(
                      color: Color(0xff7F7FAD),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 58),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              margin: EdgeInsets.only(
                                right: 12,
                              ),
                              //color: Color(0xffFE6C4D),
                              decoration: BoxDecoration(
                                  color: Color(0xffFE6C4D),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/6-logoCheck2.png",
                                      width: 14.05,
                                      height: 10.22,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "Unlock Our Top Charts",
                              style: cPoppinsWhiteRegular16,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              margin: EdgeInsets.only(
                                right: 12,
                              ),
                              //color: Color(0xffFE6C4D),
                              decoration: BoxDecoration(
                                  color: Color(0xffFE6C4D),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/6-logoCheck2.png",
                                      width: 14.05,
                                      height: 10.22,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "Save More than 1,000 Docs",
                              style: cPoppinsWhiteRegular16,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              margin: EdgeInsets.only(
                                right: 12,
                              ),
                              //color: Color(0xffFE6C4D),
                              decoration: BoxDecoration(
                                  color: Color(0xffFE6C4D),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/6-logoCheck2.png",
                                      width: 14.05,
                                      height: 10.22,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "24/7 Customer Support",
                              style: cPoppinsWhiteRegular16,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              margin: EdgeInsets.only(
                                right: 12,
                              ),
                              //color: Color(0xffFE6C4D),
                              decoration: BoxDecoration(
                                  color: Color(0xffFE6C4D),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/6-logoCheck2.png",
                                      width: 14.05,
                                      height: 10.22,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "Track Company’s Spending",
                              style: cPoppinsWhiteRegular16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  /*Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 55,
                        //padding: EdgeInsets.all(7),
                        //color: Color(0xffE57C73),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffE57C73).withOpacity(0.5),
                              blurRadius: 20,
                              offset: Offset(0, 22),
                              spreadRadius: -10,
                            )
                          ],
                          color: Color(0xffE57C73),
                          borderRadius: BorderRadius.circular(31),
                        ),
                      ),
                      Material(
                        child: InkWell(
                          splashColor: Colors.green,
                          borderRadius: BorderRadius.circular(31),
                          onTap: () {
                            print("haloo");
                          },
                          child: Ink(
                            width: double.infinity,
                            height: 55,
                            padding: EdgeInsets.all(7),
                            //color: Color(0xffE57C73),
                            decoration: BoxDecoration(
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Color(0xffE57C73).withOpacity(0.5),
                              //     blurRadius: 20,
                              //     offset: Offset(0, 20),
                              //     //spreadRadius: -4,
                              //   )
                              // ],
                              color: Color(0xffE57C73),
                              borderRadius: BorderRadius.circular(31),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    "Subscribe Now",
                                    style: cPoppinsWhiteSemibold24.copyWith(
                                        fontSize: 16),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 41,
                                    height: 41,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffFAACA5),
                                    ),
                                    child: Image.asset(
                                        "assets/images/6-logoArrow.png"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        color: Colors.transparent,
                      ),
                    ],
                  ),*/
                  Container(
                    width: double.infinity,
                    height: 60,
                    //padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 30),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(53),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffE57C73).withOpacity(0.5),
                          blurRadius: 20,
                          offset: Offset(0, 22),
                          spreadRadius: -10,
                        )
                      ],
                    ),
                    // decoration: BoxDecoration(
                    //   color: Color(0xffFFC532),
                    //   borderRadius: BorderRadius.circular(53),
                    // ),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        // shadowColor:Color(0xffE57C73),
                        // elevation: 20,
                        backgroundColor: Color(0xffE57C73),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(53),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              "Subscribe Now",
                              style: cPoppinsWhiteSemibold24.copyWith(
                                  fontSize: 16),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 41,
                              height: 41,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFAACA5),
                              ),
                              child:
                                  Image.asset("assets/images/6-logoArrow.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Contact Support",
                      style: cPoppinsWhiteRegular16.copyWith(
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
