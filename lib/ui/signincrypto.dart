import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';

class SignInCrypto extends StatelessWidget {
  const SignInCrypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBlackBackground,
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              //color: cOrangeButton,
              margin: EdgeInsets.only(top: 70, bottom: 70),
              decoration: BoxDecoration(
                color: cOrangeButton,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "assets/images/3-logoEuro.png",
                width: 29,
                height: 29,
              ),
            ),
            Text(
              "Welcome back.\nLet’s make money.",
              style: cPoppinsWhiteSemibold24,
            ),
            SizedBox(
              height: 70,
            ),
            TextFormField(
              cursorColor: Colors.white,
              style: cOpenSansWhiteRegular14,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                hintText: "Input Your Email",
                //hintTextDirection: TextDirection.rtl,
                hintStyle:
                    cOpenSansWhiteRegular14.copyWith(color: cGreyTextForm),
                filled: true,
                fillColor: cGreyForm,

                //hoverColor: Colors.black,
                //focusColor: Colors.green,

                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    //borderSide: BorderSide(width: 0, style: BorderStyle.none),

                    borderSide: BorderSide.none),

                /*focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 5,
                    //style: BorderStyle.solid,
                  ),
                ),*/
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              cursorColor: Colors.white,
              style: cOpenSansWhiteRegular14,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                contentPadding: EdgeInsets.all(20),
                //hintTextDirection: TextDirection.rtl,
                hintStyle:
                    cOpenSansWhiteRegular14.copyWith(color: cGreyTextForm),
                filled: true,
                fillColor: cGreyForm,

                //hoverColor: Colors.black,
                //focusColor: Colors.green,

                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    //borderSide: BorderSide(width: 0, style: BorderStyle.none),

                    borderSide: BorderSide.none),

                /*focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 5,
                    //style: BorderStyle.solid,
                  ),
                ),*/
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot My Password",
                style: cPoppinsGreyRegular14,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              height: 55,
              margin: EdgeInsets.only(top: 131),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: cOrangeButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  //padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {},
                child: Text(
                  "Sign In",
                  style: cOpenSansGreySemibold18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
