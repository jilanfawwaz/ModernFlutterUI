import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';

class CobaShayna extends StatefulWidget {
  const CobaShayna({Key? key}) : super(key: key);

  final String nameRoute = '/cobashayna';

  @override
  State<CobaShayna> createState() => _CobaShaynaState();
}

class _CobaShaynaState extends State<CobaShayna> {
  //bool _buttonSelected = false;
  @override
  Widget build(BuildContext context) {
    //final _width = MediaQuery.of(context).size.width;
    //final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 30,
                right: 30,
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Profile Picture",
                    style: cPoppinsWhiteSemibold24.copyWith(
                        color: Color(0xff314728), fontSize: 20),
                  ),
                  Container(
                    width: 140,
                    height: 140,
                    margin: EdgeInsets.only(top: 50, bottom: 16),
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                          width: 46,
                          height: 16.43,
                          decoration: BoxDecoration(
                            color: clHijau,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Container(
                          width: 46,
                          height: 16.43,
                          decoration: BoxDecoration(
                            color: clOranye,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Anne Margaritha",
                    style: cPoppinsWhiteMedium18.copyWith(
                        color: Color(0xff314728), fontSize: 18),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "UX Designer",
                    style: cPoppinsGreyRegular14.copyWith(
                        color: Color(0xffA9B0A6), fontSize: 16),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Wrap(
                    spacing: 38,
                    runSpacing: 40,
                    children: [
                      Container(
                        //margin: EdgeInsets.only(top: 70),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 10,
                              ),
                              width: 16,
                              height: 38,
                              decoration: BoxDecoration(
                                color: clOranye,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            Container(
                              width: 16,
                              height: 38,
                              decoration: BoxDecoration(
                                color: clHijau,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 10,
                              ),
                              width: 16,
                              height: 38,
                              decoration: BoxDecoration(
                                color: clHijau,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            Container(
                              height: 38,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 16,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      color: clOranye,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                  Container(
                                    width: 16,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: clTosca,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 10,
                              ),
                              width: 16,
                              height: 38,
                              decoration: BoxDecoration(
                                color: clTosca,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            Container(
                              width: 16,
                              height: 38,
                              decoration: BoxDecoration(
                                color: clHijau,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: clHijau,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 10,
                              ),
                              width: 38,
                              height: 16,
                              decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Container(
                              width: 38,
                              height: 16,
                              decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 10,
                              ),
                              width: 38,
                              height: 16,
                              decoration: BoxDecoration(
                                color: clHijau,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            Container(
                              width: 38,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 13,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: clOranye,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  Container(
                                    width: 21,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: clTosca,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 38,
                              margin: EdgeInsets.only(
                                right: 10,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 16,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      color: clOranye,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                  Container(
                                    width: 16,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: clTosca,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 16,
                              height: 38,
                              decoration: BoxDecoration(
                                color: clHijau,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // NOTE: bisa milih mau make wrap atau row biasa

                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //margin: EdgeInsets.only(top: 70),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 10,
                              ),
                              width: 16,
                              height: 38,
                              decoration: BoxDecoration(
                                color: clOranye,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            Container(
                              width: 16,
                              height: 38,
                              decoration: BoxDecoration(
                                color: clHijau,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 10,
                              ),
                              width: 16,
                              height: 38,
                              decoration: BoxDecoration(
                                color: clHijau,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            Container(
                              height: 38,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 16,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      color: clOranye,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                  Container(
                                    width: 16,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: clTosca,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 10,
                              ),
                              width: 16,
                              height: 38,
                              decoration: BoxDecoration(
                                color: clTosca,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            Container(
                              width: 16,
                              height: 38,
                              decoration: BoxDecoration(
                                color: clHijau,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: clHijau,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 10,
                              ),
                              width: 38,
                              height: 16,
                              decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Container(
                              width: 38,
                              height: 16,
                              decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 10,
                              ),
                              width: 38,
                              height: 16,
                              decoration: BoxDecoration(
                                color: clHijau,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            Container(
                              width: 38,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 13,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: clOranye,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  Container(
                                    width: 21,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: clTosca,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 38,
                              margin: EdgeInsets.only(
                                right: 10,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 16,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      color: clOranye,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                  Container(
                                    width: 16,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: clTosca,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 16,
                              height: 38,
                              decoration: BoxDecoration(
                                color: clHijau,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),*/
                  //Spacer(),
                  Container(
                    width: 224,
                    height: 55,
                    margin: EdgeInsets.only(top: 70),
                    // decoration: BoxDecoration(
                    //   color: Color(0xffFFFFFF),
                    //   borderRadius: BorderRadius.circular(16),
                    // ),
                    child: TextButton(
                      onPressed: () {
                        // setState(() {
                        //   _buttonSelected = true;
                        // });
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Container(
                              width: double.infinity,
                              height: 290,
                              decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 50,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Update Photo",
                                      style: cPoppinsWhiteMedium18.copyWith(
                                          color: Color(0xff314728),
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "You are only able to change\nthe picture profile once",
                                      style: cPoppinsGreyRegular14.copyWith(
                                          color: Color(0xffA9B0A6),
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                    Container(
                                      width: 224,
                                      height: 55,
                                      margin: EdgeInsets.only(top: 30),
                                      // decoration: BoxDecoration(
                                      //   color: Color(0xffFFFFFF),
                                      //   borderRadius: BorderRadius.circular(16),
                                      // ),
                                      child: TextButton(
                                        onPressed: () {
                                          // setState(() {
                                          //   _buttonSelected = false;
                                          // });
                                          //Navigator.pop(context);
                                          Navigator.of(context).pop();
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Color(0xffF9B650),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                        child: Text(
                                          "Continue",
                                          style: cPoppinsWhiteMedium18.copyWith(
                                            //color: Color(0xff314728),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        "Update Profile",
                        style: cPoppinsWhiteMedium18.copyWith(
                            color: Color(0xff314728), fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*_buttonSelected
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color(0xffFFFFFF).withOpacity(0.3),
                  )
                : SizedBox(),
            _buttonSelected
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 290,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 50,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Update Photo",
                              style: cPoppinsWhiteMedium18.copyWith(
                                  color: Color(0xff314728), fontSize: 16),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "You are only able to change\nthe picture profile once",
                              style: cPoppinsGreyRegular14.copyWith(
                                  color: Color(0xffA9B0A6), fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              width: 224,
                              height: 55,
                              margin: EdgeInsets.only(top: 30),
                              // decoration: BoxDecoration(
                              //   color: Color(0xffFFFFFF),
                              //   borderRadius: BorderRadius.circular(16),
                              // ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _buttonSelected = false;
                                  });
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xffF9B650),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  "Continue",
                                  style: cPoppinsWhiteMedium18.copyWith(
                                    //color: Color(0xff314728),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : SizedBox(),*/
          ],
        ),
      ),
    );
  }
}
