import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/kost2provider.dart';
import 'package:modern_flutter_ui/models/kost2modelkedua.dart';
import 'package:modern_flutter_ui/widget/kost2widgetcardkedua.dart';
import 'package:modern_flutter_ui/widget/kost2widgetcardpertama.dart';
import 'package:provider/provider.dart';

import '../models/kost2model.dart';
import '../shared/theme.dart';

class KostHomeContent extends StatelessWidget {
  const KostHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Explore Now',
          style:
              cPoppinsWhiteMedium18.copyWith(color: Colors.black, fontSize: 24),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          'Mencari kosan yang cozy',
          style: cPoppinsWhiteLight16.copyWith(color: Color(0xff82868E)),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Popular Cities',
          style: cPoppinsWhiteRegular16.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var item in Provider.of<KostProvider>(context).dataCity)
                /*KostCardPertama(
                  city: KostModel(
                      name: item.name,
                      ImageURL: item.ImageURL,
                      isFavorite: item.isFavorite),
                )*/
                KostCardPertama(city: item),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Recommended Space',
          style: cPoppinsWhiteRegular16.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 16,
        ),
        for (var item in Provider.of<KostProvider>(context).dataSpace)
          /*KostCardKedua(
            space: KostModelKedua(
              name: item.name,
              ImageURL: item.ImageURL,
              price: item.price,
              location: item.location,
              rating: item.rating,
            ),
          ),*/
          KostCardKedua(space: item),
        Text(
          'Tips & Guidance',
          style: cPoppinsWhiteRegular16.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                width: 80,
                height: 80,
                color: Color(0xffD8D8F8),
                /*decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Color(0xffD8D8F8),
                  image: DecorationImage(
                    alignment: Alignment(-0.8, 0),
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/kost2image1.png',
                    ),
                  ),
                ),*/

                child: Transform(
                  transform: Matrix4.translationValues(-12, 12, 0.0),
                  child: Image.asset('assets/images/kost2image1.png'),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'City Guidelines',
                  style: cPoppinsWhiteMedium18.copyWith(
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.fade,
                  //maxLines: 1,
                  softWrap: false,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Updated 20 Apr',
                  style: cPoppinsWhiteLight16.copyWith(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.fade,
                  //maxLines: 1,
                  softWrap: false,
                ),
              ],
            ),
            Spacer(),
            Image.asset(
              'assets/images/kost2logonext.png',
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 6,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                width: 80,
                height: 80,
                color: Color(0xffD8D8F8),  
                child: Transform(
                  transform: Matrix4.translationValues(-12, 12, 0.0),
                  child: Image.asset('assets/images/kost2image2.png'),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jakarta Fairship',
                  style: cPoppinsWhiteMedium18.copyWith(
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.fade,
                  //maxLines: 1,
                  softWrap: false,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Updated 11 Dec',
                  style: cPoppinsWhiteLight16.copyWith(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.fade,
                  //maxLines: 1,
                  softWrap: false,
                ),
              ],
            ),
            Spacer(),
            Image.asset(
              'assets/images/kost2logonext.png',
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 6,
            ),
          ],
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
