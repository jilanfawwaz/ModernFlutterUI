import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';
//! Done Screen G.Doc

class GetStartedYoga extends StatelessWidget {
  const GetStartedYoga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(47),
          children: [
            Text(
              "Health First",
              style: cPoppinsWhiteSemibold24.copyWith(
                color: Colors.black,
              ),
              //textAlign: TextAlign.end,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Exercise together with our best\ncommunity fit in the world",
              style: cPoppinsWhiteRegular16.copyWith(
                color: cGreyText,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 138,
                            height: 248,
                            margin: EdgeInsets.only(
                              bottom: 19,
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/2-cardImage1.png"),
                              ),
                            ),
                          ),
                          Container(
                            width: 138,
                            height: 135,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/2-cardImage2.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 19,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 138,
                            height: 135,
                            margin: EdgeInsets.only(
                              bottom: 19,
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/2-cardImage3.png"),
                              ),
                            ),
                          ),
                          Container(
                            width: 138,
                            height: 248,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/2-cardImage4.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 295,
              height: 55,
              margin: EdgeInsets.only(
                top: 71,
                bottom: 20,
              ),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: cGreenButton,
                ),
                child: Text(
                  "Shape My Body",
                  style: cLatosBlackSemibold18,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Terms & Conditions",
                style: cPoppinsWhiteRegular16.copyWith(
                  color: cGreyTerms,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
