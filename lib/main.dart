import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/ui/cobadateappbar.dart';
import 'package:modern_flutter_ui/ui/cobastate.dart';
import 'package:modern_flutter_ui/ui/cobatraversymedia.dart';
import 'package:modern_flutter_ui/ui/emptystatebelanja.dart';
import 'package:modern_flutter_ui/ui/emptystatebisnis.dart';
import 'package:modern_flutter_ui/ui/getstartedcrypto.dart';
import 'package:modern_flutter_ui/ui/getstartedyoga.dart';
import 'package:modern_flutter_ui/ui/halamanutama1.dart';
import 'package:modern_flutter_ui/ui/pricingpurple.dart';
import 'package:modern_flutter_ui/ui/cobamap.dart';
import 'package:modern_flutter_ui/ui/pricingwhite.dart';
import 'package:modern_flutter_ui/ui/randomfood.dart';
import 'package:modern_flutter_ui/ui/randomholiday.dart';
import 'package:modern_flutter_ui/ui/ratinggojek.dart';
import 'package:modern_flutter_ui/ui/ratingmakanan.dart';
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

      /*theme: ThemeData(
        colorScheme: ColorScheme.light(primary: Colors.green.shade900),
      ),*/

      //theme: ThemeData(primarySwatch: Colors.green),

      /*theme: Theme.of(context).copyWith(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              color: Colors.red,
            ),
      ),*/

      theme: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.purple,
        ),
      ),

      routes: {
        '/': (context) => CobaDateAppBar(),
        '/splashscreen': (context) => SplashScreen1(),
        '/halamanutama1': (context) => HalamanUtama1(),
        '/getstartedcypto': (context) => GetStartedCrypto(),
        '/getstartedyoga': (context) => GetStartedYoga(),
        '/signincrypto': (context) => SignInCrypto(),
        '/signinwallet': (context) => SignInWallet(),
        '/emptybelanja': (context) => EmptyBelanja(),
        '/emptybisnis': (context) => EmptyBisnis(),
        '/ratingmakanan': (context) => RatingMakanan(),
        '/ratinggojek': (context) => RatingGojek(),
        '/cobastate': (context) => CobaState(),
        '/cobamap': (context) => CobaMap(),
        '/pricingwhite': (context) => PricingWhite(),
        '/pricingpurple': (context) => PricingPurple(),
        '/randomfood': (context) => RandomFood(),
        '/randomholiday': (context) => RandomHoliday(),
        '/cobadateappbar': (context) => CobaDateAppBar(),
      },
    );
  }
}
