import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/models/kost2model.dart';

import '../shared/theme.dart';

class KostCardPertama extends StatelessWidget {
  final KostModel city;
  const KostCardPertama({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          width: 120,
          height: 150,
          color: Color(0xffF6F7F8),
          child: Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Container(
                  height: 102,
                  width: 120,
                  child: Image.asset(
                    city.ImageURL,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 13, left: 10, right: 10),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      city.name,
                      style: cPoppinsWhiteMedium18.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.fade,
                      //maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                ),
                city.isFavorite
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xff5843BE),
                                borderRadius: BorderRadius.only(
                                  //topRight: Radius.circular(18),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/images/kost2logobintang.png',
                                  width: 22,
                                  height: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
