import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';
//! Done Screen G.Doc

class SignInCrypto extends StatefulWidget {
  const SignInCrypto({Key? key}) : super(key: key);

  @override
  State<SignInCrypto> createState() => _SignInCryptoState();
}

class _SignInCryptoState extends State<SignInCrypto> {
  FocusNode _textFieldFocus = FocusNode();
  Color _color = cGreyForm;

  FocusNode _textFieldFocus2 = FocusNode();
  Color _color2 = cGreyForm;

  @override
  void initState() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _color = Colors.grey.shade200;
        });
      } else {
        setState(() {
          _color = cGreyForm;
        });
      }
    });

    _textFieldFocus2.addListener(() {
      if (_textFieldFocus2.hasFocus) {
        setState(() {
          _color2 = Colors.grey.shade200;
        });
      } else {
        setState(() {
          _color2 = cGreyForm;
        });
      }
    });

    super.initState();
  }

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
              cursorColor: cGreyTextForm,
              style: cOpenSansWhiteRegular14.copyWith(color: cGreyTextForm),
              focusNode: _textFieldFocus, //untuk melisten kalau textform dipencet atau ngga
              decoration: InputDecoration(
                //labelText: "Email",
                contentPadding: EdgeInsets.all(18),
                isDense:
                    true, //mematikan padding defauld dari text di dalam textformfield
                hintText: "Input Your Email",
                //hintTextDirection: TextDirection.rtl,
                hintStyle:
                    cOpenSansWhiteRegular14.copyWith(color: cGreyTextForm),
                filled: true,
                fillColor: _color,

                //hoverColor: Colors.black,
                //focusColor: Colors.green,

                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    //borderSide: BorderSide(width: 0, style: BorderStyle.none),

                    borderSide: BorderSide.none),

                //focusColor: Colors.green, //ga fungsi
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                  borderSide: BorderSide(
                    color: cGreyTextForm,
                    width: 3,
                  ),
                ),

                /*focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(x
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
              cursorColor: cGreyTextForm,
              style: cOpenSansWhiteRegular14.copyWith(color: cGreyTextForm),
              focusNode: _textFieldFocus2,
              obscureText: true,
              decoration: InputDecoration(
                /*prefixIcon: Image.asset(
                  "assets/images/3-logoeye.png",
                  width: 1,
                  height: 1,
                ),*/

                /*suffixIcon: Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/3-logoeye.png"),
                    ),
                  ),
                ),*/

                /*suffix: Column(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("show Password");
                      },
                      child: Container(
                        //margin: EdgeInsets.only(top: 0),
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/3-logoeye.png"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),*/

                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye_sharp,
                    color: cGreyTextForm,
                  ),
                  onPressed: () {
                    print('Search');
                  },
                ),

                hintText: "Password",
                contentPadding: EdgeInsets.all(18),
                isDense: true,
                //hintTextDirection: TextDirection.rtl,
                hintStyle:
                    cOpenSansWhiteRegular14.copyWith(color: cGreyTextForm),
                filled: true,
                fillColor: _color2,

                //hoverColor: Colors.black,
                //focusColor: Colors.green,

                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    //borderSide: BorderSide(width: 0, style: BorderStyle.none),

                    borderSide: BorderSide.none),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                  borderSide: BorderSide(
                    color: cGreyTextForm,
                    width: 3,
                  ),
                ),

                /*focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 5,
                    //style: BorderStyle.solid,
                  ),
                ),*/
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot My Password",
                    style: cPoppinsGreyRegular14,
                    //textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 55,
              margin: EdgeInsets.only(
                top: 131,
                bottom: 30,
              ),
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
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                //child: Text("Don’t have account? Sign Up"),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Don’t have account?",
                        style:
                            cPoppinsGreyRegular14.copyWith(color: Colors.white),
                      ),
                      TextSpan(
                        text: " Sign Up",
                        style: cPoppinsGreyRegular14.copyWith(
                            color: Colors.white,
                            fontWeight: semiBold,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


