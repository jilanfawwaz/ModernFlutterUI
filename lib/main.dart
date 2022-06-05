import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/ui/getstartedcrypto.dart';
import 'package:modern_flutter_ui/ui/getstartedyoga.dart';
import 'package:modern_flutter_ui/ui/halamanutama1.dart';
import 'package:modern_flutter_ui/ui/signincrypto.dart';
import 'package:modern_flutter_ui/ui/signinwallet.dart';
import 'package:modern_flutter_ui/ui/splashscreen1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SignInWallet(),
        '/halamanutama1': (context) => HalamanUtama1(),
        '/getstartedcypto': (context) => GetStartedCrypto(),
        '/getstartedyoga': (context) => GetStartedYoga(),
        '/signincrypto': (context) => SignInCrypto(),
        '/signinwallet': (context) => SignInWallet(),
      },
      //home: SplashScreen1(),
    );
  }
}
