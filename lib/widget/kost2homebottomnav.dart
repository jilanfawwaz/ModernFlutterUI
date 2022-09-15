import 'package:flutter/material.dart';

class KostHomeBottomNav extends StatelessWidget {
  const KostHomeBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Container(
                  width: 26,
                  height: 26,
                  child: Image.asset('assets/images/kost2logorumah.png'),
                ),
                Container(
                  width: 30,
                  height: 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    color: Color(0xff7F74EB),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Container(
                  width: 26,
                  height: 26,
                  child: Image.asset('assets/images/kost2logosurat.png'),
                ),
                /*Container(
                  width: 30,
                  height: 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    color: Color(0xff7F74EB),
                  ),
                ),*/
                SizedBox(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Container(
                  width: 26,
                  height: 26,
                  child: Image.asset('assets/images/kost2logocard.png'),
                ),
                /*Container(
                  width: 30,
                  height: 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    color: Color(0xff7F74EB),
                  ),
                ),*/
                SizedBox(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Container(
                  width: 26,
                  height: 26,
                  child: Image.asset('assets/images/kost2logolove.png'),
                ),
                /*Container(
                  width: 30,
                  height: 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    color: Color(0xff7F74EB),
                  ),
                ),*/
                SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
