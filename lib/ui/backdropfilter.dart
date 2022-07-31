import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';

class CobaBackdropFilter extends StatelessWidget {
  const CobaBackdropFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/backgroundspace.jpeg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(
                            17,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            //NOTE:BakcdroopFilter untuk membuat efek blur

                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 5,
                                sigmaY: 5,
                              ),
                              child: Container(
                                width: 300,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white.withOpacity(0.2),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 4,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //NOTES:RotatedBox mutar dalam sudut 90, 180, 270 drajat
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: RotatedBox(
                                        quarterTurns: 1,
                                        child: Image.asset(
                                          'assets/images/backdropfilterchip.png',
                                          width: 70,
                                          height: 70,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 25),
                                      child: Text(
                                        '8890 2243 8709 4150',
                                        style: cPoppinsWhiteSemibold24.copyWith(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Muhammad Jilan',
                                            style: cPoppinsWhiteRegular16,
                                          ),
                                          Spacer(),
                                          Image.asset(
                                            'assets/images/backdropfilterlogomastercard.png',
                                            height: 50,
                                            width: 50,
                                          ),
                                        ],
                                      ),
                                    ),
                                    //NOTES:Transform.rotate mutar dalam sudut drajat custom
                                    /*Transform.rotate(
                                angle: math.pi / 2,
                                child: Image.asset(
                                  'assets/images/backdropfilterchip.png',
                                  width: 70,
                                  height: 70,
                                ),
                              ),*/
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 17,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 5,
                                sigmaY: 5,
                              ),
                              child: Container(
                                width: 300,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white.withOpacity(0.2),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 4,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //NOTES:RotatedBox mutar dalam sudut 90, 180, 270 drajat
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: RotatedBox(
                                        quarterTurns: 1,
                                        child: Image.asset(
                                          'assets/images/backdropfilterchip.png',
                                          width: 70,
                                          height: 70,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 25),
                                      child: Text(
                                        '8890 2243 8709 4150',
                                        style: cPoppinsWhiteSemibold24.copyWith(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Muhammad Jilan',
                                            style: cPoppinsWhiteRegular16,
                                          ),
                                          Spacer(),
                                          Image.asset(
                                            'assets/images/backdropfilterlogomastercard.png',
                                            height: 50,
                                            width: 50,
                                          ),
                                        ],
                                      ),
                                    ),
                                    //NOTES:Transform.rotate mutar dalam sudut drajat custom
                                    /*Transform.rotate(
                                angle: math.pi / 2,
                                child: Image.asset(
                                  'assets/images/backdropfilterchip.png',
                                  width: 70,
                                  height: 70,
                                ),
                              ),*/
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 17,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 5,
                                sigmaY: 5,
                              ),
                              child: Container(
                                width: 300,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white.withOpacity(0.2),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 4,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //NOTES:RotatedBox mutar dalam sudut 90, 180, 270 drajat
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: RotatedBox(
                                        quarterTurns: 1,
                                        child: Image.asset(
                                          'assets/images/backdropfilterchip.png',
                                          width: 70,
                                          height: 70,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 25),
                                      child: Text(
                                        '8890 2243 8709 4150',
                                        style: cPoppinsWhiteSemibold24.copyWith(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Muhammad Jilan',
                                            style: cPoppinsWhiteRegular16,
                                          ),
                                          Spacer(),
                                          Image.asset(
                                            'assets/images/backdropfilterlogomastercard.png',
                                            height: 50,
                                            width: 50,
                                          ),
                                        ],
                                      ),
                                    ),
                                    //NOTES:Transform.rotate mutar dalam sudut drajat custom
                                    /*Transform.rotate(
                                angle: math.pi / 2,
                                child: Image.asset(
                                  'assets/images/backdropfilterchip.png',
                                  width: 70,
                                  height: 70,
                                ),
                              ),*/
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 17,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 5,
                                sigmaY: 5,
                              ),
                              child: Container(
                                width: 300,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white.withOpacity(0.2),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 4,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //NOTES:RotatedBox mutar dalam sudut 90, 180, 270 drajat
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: RotatedBox(
                                        quarterTurns: 1,
                                        child: Image.asset(
                                          'assets/images/backdropfilterchip.png',
                                          width: 70,
                                          height: 70,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 25),
                                      child: Text(
                                        '8890 2243 8709 4150',
                                        style: cPoppinsWhiteSemibold24.copyWith(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Muhammad Jilan',
                                            style: cPoppinsWhiteRegular16,
                                          ),
                                          Spacer(),
                                          Image.asset(
                                            'assets/images/backdropfilterlogomastercard.png',
                                            height: 50,
                                            width: 50,
                                          ),
                                        ],
                                      ),
                                    ),
                                    //NOTES:Transform.rotate mutar dalam sudut drajat custom
                                    /*Transform.rotate(
                                angle: math.pi / 2,
                                child: Image.asset(
                                  'assets/images/backdropfilterchip.png',
                                  width: 70,
                                  height: 70,
                                ),
                              ),*/
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
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


