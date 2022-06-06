import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';

class RatingGojek extends StatelessWidget {
  const RatingGojek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 295,
                height: 210,
                margin: EdgeInsets.only(top: 80, bottom: 50),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/5-gambarOrang.png"),
                  ),
                ),
              ),
              Text(
                "Enjoy Your Meal",
                style: cPoppinsWhiteSemibold24.copyWith(
                  color: Color(0xff121622),
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "Please rate our experience",
                style: cPoppinsWhiteRegular16.copyWith(
                  color: Color(0xff808EAB),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      print("bintang 1");
                    },
                    iconSize: 60,
                    icon: Icon(
                      Icons.star_rate_rounded,
                      //size: 60,
                      color: Color(0xffFFC648),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    padding: EdgeInsets.zero,
                    //color: Colors.red,
                    child: Icon(
                      Icons.star_rate_rounded,
                      size: 60,
                      color: Color(0xffFFC648),
                    ),
                  ),
                  Container(
                      height: 60,
                      width: 60,
                      padding: EdgeInsets.zero,
                      //color: Colors.red,
                      child: IconButton(
                        onPressed: () {
                          print("bintang 3");
                        },
                        padding: EdgeInsets.zero,
                        //constraints: BoxConstraints(),
                        icon: Icon(
                          Icons.star_rate_rounded,
                          size: 60,
                          color: Color(0xffFFC648),
                        ),
                      )),
                  Icon(
                    Icons.star_rate_rounded,
                    size: 60,
                    color: Color(0xffFFC648),
                  ),
                  Icon(
                    Icons.star_rate_rounded,
                    size: 60,
                    color: Color(0xffF8F8F8),
                  ),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              Container(
                height: 150,
                width: double.infinity,
                child: TextField(
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines:
                      5, //null jika mau height auto menyesuaikan dengan jumlah line dari text
                  //expands: true, //expands cuma bisa dipake kalau maxlines null
                  cursorColor: Color(0xff808EAB),
                  style: cPoppinsGreyRegular14.copyWith(color: cBlackForm),
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.only(top: 65, bottom: 65),
                    //isCollapsed: true,
                    //isDense: true,
                    labelText: "Your Message",
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    //floatingLabelStyle: const TextStyle(fontSize: 16),
                    //label: Center(child: Text("Your Message")),

                    alignLabelWithHint: true,

                    labelStyle: cPoppinsGreyRegular14.copyWith(
                        color: Color(0xff808EAB)),
                    hintText: "Your Message",
                    hintStyle: cPoppinsGreyRegular14.copyWith(
                        color: Color(0xff808EAB)),
                    fillColor: Color(0xffF8F8F8),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 55,
                margin: EdgeInsets.only(top: 30),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff4074E6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: Text(
                    "Submit Review",
                    style: cPoppinsWhiteSemibold24.copyWith(fontSize: 16),
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
