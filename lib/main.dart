import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_flutter_ui/Providers/providerallproduct.dart';
import 'package:modern_flutter_ui/Providers/providercart.dart';
import 'package:modern_flutter_ui/Providers/providermodel.dart';

import 'package:modern_flutter_ui/ui/coba_dialog_dismissible_drawer.dart';
import 'package:modern_flutter_ui/ui/cobadatepickercupertino.dart';
import 'package:modern_flutter_ui/ui/cobagridview.dart';
import 'package:modern_flutter_ui/ui/cobaprovidercart.dart';
import 'package:modern_flutter_ui/ui/cobaproviderdetail.dart';
import 'package:modern_flutter_ui/ui/cobaproviderfavorite.dart';
import 'package:modern_flutter_ui/ui/cobaproviderhome.dart';
import 'package:modern_flutter_ui/ui/cobashayna.dart';
import 'package:modern_flutter_ui/ui/cobamediaquery.dart';
import 'package:modern_flutter_ui/ui/cobadateappbar.dart';
import 'package:modern_flutter_ui/ui/cobastateswitch.dart';
import 'package:modern_flutter_ui/ui/cobatabbar.dart';
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
//import 'package:modern_flutter_ui/widget/badge.dart';
import 'package:provider/provider.dart';

void main() {
  //NOTE: Device Orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    //[DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft],
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ],
  );
  //ENDNOTE: Device Orientation

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //NOTE:MultiProvider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AllProduct()),
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        //berfungsi kalau make materialColor (Colors.ambers), color biasa gakbisa ( Color(0xffF3f3f3) )
        /*theme: ThemeData(
          primarySwatch: Colors.red,
        ),*/

        /*theme: Theme.of(context).copyWith(
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
                color: Colors.red,
              ),
        ),*/

        /*theme: ThemeData(
          colorScheme: ColorScheme.light(primary: Colors.green.shade900),
        ),*/

        /*theme: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.purple,
        ),
        ),*/

        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          appBarTheme: AppBarTheme(
            color: Colors.purple,
          ),
        ),
        //initialRoute: '/cobashayna',

        routes: {
          '/': (context) => CobaProvider(),
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
          CobaShayna().nameRoute: (context) => CobaShayna(),
          '/cobatabbar': (context) => CobaTabBar(),
          '/cobagridview': (context) => CobaGridView(),
          '/cobadatepickercupertino': (context) => CobaDatePickerCupertino(),
          //data2 provider: models = providermodel; ui = cobaproviderdetail,cobaproviderhome, cobaproviderfavorite; widget = providerwidget, providerwidgetgrid; providers = providerallproduct
          CobaProvider.nameRoute: (context) => CobaProvider(),
          CobaProviderDetail.nameRoute: (context) => CobaProviderDetail(),
          CobaProviderFavorite.nameRoute: (context) => CobaProviderFavorite(),
          CobaProviderCart.nameRoute: (context) => CobaProviderCart(),
        },
      ),
    );
  }
}
