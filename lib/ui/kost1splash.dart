import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';

class KostSplash extends StatelessWidget {
  const KostSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //alignment: Alignment.bottomCenter,
        //alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/kostLogo.png',
                  height: 50,
                  width: 50,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Find Cozy House\nto Stay and Happy',
                  style: TextStyle(fontSize: 24, fontWeight: medium),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Stop membuang banyak waktu\npada tempat yang tidak habitable',
                  style: TextStyle(
                      color: Color(0xff82868E),
                      fontSize: 16,
                      fontWeight: light),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  width: 210,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff5843BE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Explore Now',
                      style: cPoppinsWhiteMedium18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              //alignment: Alignment.bottomCenter,
              height: 289,
              width: double.infinity,
              color: Color(0xffFF9376),
            ),
          ),
          //Image.asset('assets/images/kostHouse.png',height: ,),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 339,
              height: 431,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/kostHouse.png'),
                ),
              ),
            ),
          ),
          Column(
            children: [],
          ),
        ],
      ),
    );
  }
}
