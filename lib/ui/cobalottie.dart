import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modern_flutter_ui/shared/theme.dart';

class CobaLottie extends StatelessWidget {
  const CobaLottie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Lottie(composition: composition),
            SizedBox(
              height: 250,
              child: Lottie.asset('assets/json/50124-user-profile.json'),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              width: 300,
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Text('Username'),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      //labelText: 'Username',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 300,
              child: Column(
                children: [
                  Text('Password'),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      //labelText: 'Username',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 200,
              height: 60,

              /*decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue,
              ),*/
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Login',
                  style: cPoppinsWhiteMedium18,
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  //mengganti warna ripple
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
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
