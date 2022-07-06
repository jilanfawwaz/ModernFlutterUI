import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modern_flutter_ui/shared/theme.dart';

class SignInWallet extends StatelessWidget {
  const SignInWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 245,
                height: 279,
                margin: EdgeInsets.only(top: 64, bottom: 53),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/3-gambarNota.png"),
                  ),
                ),
              ),
            ),
            Text(
              "Email Address",
              style: cOpenSansWhiteRegular14.copyWith(
                color: Color(0xff17171A),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              cursorColor: cBlackForm,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                isDense: true,
                hintText: "Input Email",
                hintStyle: cOpenSansWhiteRegular14.copyWith(color: cBlackForm),
                fillColor: cGreyForm2,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(71),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(71),
                  borderSide: BorderSide(color: cBlackForm),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Password",
              style: cOpenSansWhiteRegular14.copyWith(
                color: Color(0xff17171A),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              cursorColor: cBlackForm,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Input Password",
                hintStyle: cOpenSansWhiteRegular14.copyWith(color: cBlackForm),
                fillColor: cGreyForm2,
                filled: true,
                contentPadding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  bottom: 20,
                ),
                //TIPS: isDense supaya gaada padding sama sekali dari button
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(71),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(71),
                  borderSide: BorderSide(
                    color: cBlackForm,
                    width: 1, //kalo width gaada, nilai default nya adalah 1
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 55,
              margin: EdgeInsets.only(
                top: 50,
                bottom: 16,
              ),
              //color: cBlueButton,
              child: TextButton(
                onPressed: () {
                  print("Log In");
                },
                style: TextButton.styleFrom(
                  backgroundColor: cBlueButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                child: Text(
                  "Log In",
                  style: cOpenSansGreySemibold18.copyWith(
                    color: Color(0xffF8F8F8),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 55,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  //backgroundColor: cBlueButton,
                  //shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color(0xffD3D3D3),
                      width: 1,
                      //style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(60),
                    ),
                  ),
                ),
                child: Text(
                  "Create New Account",
                  style: cOpenSansWhiteRegular14.copyWith(
                    color: Color(0xffCFCFCF),
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
