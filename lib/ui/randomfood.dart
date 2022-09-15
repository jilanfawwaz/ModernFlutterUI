import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';
//! Done Screen G.Doc


class RandomFood extends StatelessWidget {
  const RandomFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 36),
        child: Center(
          child: ListView(
            children: [
              Center(
                child: Text(
                  "My Shopping Chart",
                  style: cPoppinsWhiteSemibold24.copyWith(
                    fontSize: 22,
                    color: Color(0xff191919),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 140,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/7-gambarBurger.png"),
                                ),
                              ),
                            ),
                            Spacer(),
                            Row(
                              //mainAxisSize: MainAxisSize.min,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 22,
                                  height: 22,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                      color: Color(0xffD9D9D9),
                                      shape: BoxShape.circle),
                                  child: Column(
                                    children: [
                                      Text(
                                        "-",
                                        style: cPoppinsWhiteMedium18.copyWith(
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "1",
                                  style: cPoppinsWhiteMedium18.copyWith(
                                    fontSize: 16,
                                    color: Color(0xff191919),
                                  ),
                                ),
                                //Spacer(),
                                Container(
                                  width: 22,
                                  height: 22,
                                  margin: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                      color: Color(0xff111111),
                                      shape: BoxShape.circle),
                                  child: Column(
                                    children: [
                                      Text(
                                        "+",
                                        style: cPoppinsWhiteMedium18.copyWith(
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Burger Malletaaa",
                              style: cPoppinsWhiteMedium18.copyWith(
                                color: Color(0xff191919),
                              ),
                            ),
                            Text(
                              "McTheone",
                              style: cPoppinsWhiteLight16.copyWith(
                                color: Color(0xffA3A8B8),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "\$90.00",
                        textAlign: TextAlign.center,
                        style: cPoppinsWhiteSemibold24.copyWith(
                          fontSize: 16,
                          color: Color(0xff191919),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 140,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 26),
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  image: AssetImage(
                                      "assets/images/7-gambarMojito.png"),
                                ),
                              ),
                            ),
                            Spacer(),
                            Row(
                              //mainAxisSize: MainAxisSize.min,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 22,
                                  height: 22,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                      color: Color(0xffD9D9D9),
                                      shape: BoxShape.circle),
                                  child: Column(
                                    children: [
                                      Text(
                                        "-",
                                        style: cPoppinsWhiteMedium18.copyWith(
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "1",
                                  style: cPoppinsWhiteMedium18.copyWith(
                                    fontSize: 16,
                                    color: Color(0xff191919),
                                  ),
                                ),
                                //Spacer(),
                                Container(
                                  width: 22,
                                  height: 22,
                                  margin: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                      color: Color(0xff111111),
                                      shape: BoxShape.circle),
                                  child: Column(
                                    children: [
                                      Text(
                                        "+",
                                        style: cPoppinsWhiteMedium18.copyWith(
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Mojito Orange",
                              style: cPoppinsWhiteMedium18.copyWith(
                                color: Color(0xff191919),
                              ),
                            ),
                            Text(
                              "The Bar",
                              style: cPoppinsWhiteLight16.copyWith(
                                color: Color(0xffA3A8B8),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "\$90.00",
                        textAlign: TextAlign.center,
                        style: cPoppinsWhiteSemibold24.copyWith(
                          fontSize: 16,
                          color: Color(0xff191919),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 161,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(top: 26),
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Informations",
                      style: cPoppinsWhiteMedium18.copyWith(
                        color: Color(0xff191919),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Sub total",
                          style: cPoppinsWhiteRegular16.copyWith(
                            color: Color(0xff191919),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "\$600.00",
                          style: cPoppinsWhiteRegular16.copyWith(
                            color: Color(0xff191919),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Delivery",
                          style: cPoppinsWhiteRegular16.copyWith(
                            color: Color(0xff191919),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "\$80.00",
                          style: cPoppinsWhiteRegular16.copyWith(
                            color: Color(0xff191919),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Total",
                          style: cPoppinsWhiteRegular16.copyWith(
                            color: Color(0xff191919),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "\$680.00",
                          style: cPoppinsWhiteSemibold24.copyWith(
                            fontSize: 16,
                            color: Color(0xff191919),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                margin: EdgeInsets.only(top: 60),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(53),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffFFC532).withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(0, 10),
                      spreadRadius: -2,
                    ),
                  ],
                ),
                // decoration: BoxDecoration(
                //   color: Color(0xffFFC532),
                //   borderRadius: BorderRadius.circular(53),
                // ),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffFFC532),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(53),
                    ),
                  ),
                  child: Text(
                    "Checkout Now",
                    style: cPoppinsWhiteSemibold24.copyWith(
                      fontSize: 18,
                      color: Color(0xff2E221B),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                margin: EdgeInsets.only(top: 16),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(53),
                    ),
                  ),
                  child: Text(
                    "Save to Wishlist",
                    style: cPoppinsWhiteMedium18,
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
