import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';

class PricingWhite extends StatefulWidget {
  const PricingWhite({Key? key}) : super(key: key);

  @override
  State<PricingWhite> createState() => _PricingWhiteState();
}

class _PricingWhiteState extends State<PricingWhite> {
  int selectIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget menuCard(
        {required int index,
        required String urlImage,
        required String title,
        required String subTitle}) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectIndex = index;
          });
        },
        child: Container(
          width: 315,
          height: 100,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(
            bottom: 24,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: selectIndex == index ? 2 : 1,
              color:
                  selectIndex != index ? Color(0xffD9DEEA) : Color(0xff6050E7),
            ),
            borderRadius: BorderRadius.circular(39),
          ),
          child: Row(
            children: [
              Image.asset(urlImage),
              SizedBox(
                width: 7,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: cPoppinsWhiteMedium18.copyWith(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: cPoppinsWhiteLight16.copyWith(
                      //fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Spacer(),
              selectIndex == index
                  ? Image.asset(
                      'assets/images/6-logoCheck.png',
                      width: 26,
                      height: 26,
                    )
                  : SizedBox(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
        child: Column(
          children: [
            Container(
              //color: Color(0xffFBD7FF),
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                top: 50,
                bottom: 48,
              ),
              decoration: BoxDecoration(
                  color: Color(0xffFBD7FF), shape: BoxShape.circle),
              //color: Color(0xffFBD7FF),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/6-logoMahkota.png",
                      width: 42,
                      height: 42,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Which one you wish\nto Upgrade?",
              textAlign: TextAlign.center,
              style: cPoppinsWhiteSemibold24.copyWith(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            menuCard(
              index: 1,
              urlImage: 'assets/images/6-logoCelengan.png',
              title: "Money Security",
              subTitle: "support 24/7",
            ),
            menuCard(
              index: 2,
              urlImage: 'assets/images/6-logoNota.png',
              title: "Automation",
              subTitle: "we provide Invoice",
            ),
            menuCard(
              index: 3,
              urlImage: 'assets/images/6-logoCoin.png',
              title: "Balance Report",
              subTitle: "can up to 10k",
            ),
            Spacer(),
            selectIndex == -1
                ? SizedBox()
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 21),
                    width: double.infinity,
                    height: 70,
                    color: Color(0xff6050E7),
                    child: Row(
                      children: [
                        Text(
                          "Upgrade Now",
                          style: cPoppinsWhiteSemibold24.copyWith(fontSize: 18),
                        ),
                        Spacer(),
                        Image.asset("assets/images/6-logoNext.png"),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
