import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/models/kost2modelkedua.dart';
import 'package:modern_flutter_ui/shared/theme.dart';

class KostCardKedua extends StatelessWidget {
  final KostModelKedua space;

  const KostCardKedua({
    Key? key,
    required this.space,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 30,
      ),
      child: Row(
        children: [
          Container(
            width: 130,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.purple,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(space.ImageURL),
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 70,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xff5843BE),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      bottomLeft: Radius.circular(50)),
                ),
                child: Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/kost2logobintang.png',
                        width: 18,
                        height: 18,
                      ),
                      Text(
                        '${space.rating}/5',
                        style: cPoppinsWhiteMedium18.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.name,
                style: cPoppinsWhiteMedium18.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              RichText(
                //textAlign: TextAlign.start,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "\$${space.price} ",
                      style: cPoppinsWhiteMedium18.copyWith(
                        color: Color(0xff5843BE),
                      ),
                    ),
                    TextSpan(
                      text: " / month",
                      style: cPoppinsWhiteLight16.copyWith(
                        color: Colors.grey,

                        //decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                space.location,
                style: cPoppinsWhiteLight16.copyWith(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
