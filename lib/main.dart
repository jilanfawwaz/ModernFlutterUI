import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_flutter_ui/Providers/cobaauthenticationprovider.dart';
import 'package:modern_flutter_ui/Providers/cobakeykuldiprovider.dart';
import 'package:modern_flutter_ui/Providers/cobascheckboxprovider.dart';
import 'package:modern_flutter_ui/Providers/cobasharedpreferences_and_themeprovider.dart';
import 'package:modern_flutter_ui/Providers/kost2provider.dart';
import 'package:modern_flutter_ui/Providers/providerallproduct.dart';
import 'package:modern_flutter_ui/Providers/providercart.dart';
import 'package:modern_flutter_ui/Providers/providermodelfirebase.dart';
import 'package:modern_flutter_ui/models/cobadropdownjilanmodel.dart';
import 'package:modern_flutter_ui/models/httpgetmodelprovider.dart';
//import 'package:modern_flutter_ui/Providers/providermodel.dart';
import 'package:modern_flutter_ui/models/httpmodelprovider.dart';

import 'package:modern_flutter_ui/ui/coba_dialog_dismissible_drawer.dart';
import 'package:modern_flutter_ui/ui/cobaanimatedbuilder.dart';
import 'package:modern_flutter_ui/ui/cobaanimation.dart';
import 'package:modern_flutter_ui/ui/cobaanimation2.dart';
import 'package:modern_flutter_ui/ui/cobaanimationtween.dart';
import 'package:modern_flutter_ui/ui/cobaauthenticationhome.dart';
import 'package:modern_flutter_ui/ui/cobaauthenticationlogin.dart';
import 'package:modern_flutter_ui/ui/cobaauthenticationsignup.dart';
import 'package:modern_flutter_ui/ui/cobaclip.dart';
import 'package:modern_flutter_ui/ui/cobadatepickercupertino.dart';
import 'package:modern_flutter_ui/ui/cobadropdownJilan.dart';
import 'package:modern_flutter_ui/ui/cobagridview.dart';
import 'package:modern_flutter_ui/ui/cobahalamankosong.dart';
import 'package:modern_flutter_ui/ui/cobakey.dart';
import 'package:modern_flutter_ui/ui/cobakeykuldiiadddata.dart';
import 'package:modern_flutter_ui/ui/cobakeykuldiihome.dart';
import 'package:modern_flutter_ui/ui/cobakeyyoutube.dart';
import 'package:modern_flutter_ui/ui/cobakeyyoutube2.dart';
import 'package:modern_flutter_ui/ui/cobalottie.dart';
import 'package:modern_flutter_ui/ui/cobaprovidercart.dart';
import 'package:modern_flutter_ui/ui/cobaproviderdetail.dart';
import 'package:modern_flutter_ui/ui/cobaproviderfavorite.dart';
import 'package:modern_flutter_ui/ui/cobaproviderhome.dart';
import 'package:modern_flutter_ui/ui/cobacheckbox.dart';
import 'package:modern_flutter_ui/ui/cobasharedpreferences_and_theme.dart';
import 'package:modern_flutter_ui/ui/cobashayna.dart';
import 'package:modern_flutter_ui/ui/cobamediaquery.dart';
import 'package:modern_flutter_ui/ui/cobadateappbar.dart';
import 'package:modern_flutter_ui/ui/cobastateswitch.dart';
import 'package:modern_flutter_ui/ui/cobatabbar.dart';
import 'package:modern_flutter_ui/ui/cobatraversymedia.dart';
import 'package:modern_flutter_ui/ui/emptystatebelanja.dart';
import 'package:modern_flutter_ui/ui/emptystatebisnis.dart';
import 'package:modern_flutter_ui/ui/firebaseapifuturebuilder.dart';
import 'package:modern_flutter_ui/ui/firebaseapihome.dart';
import 'package:modern_flutter_ui/ui/firebasehomedetail.dart';
import 'package:modern_flutter_ui/ui/getstartedcrypto.dart';
import 'package:modern_flutter_ui/ui/getstartedyoga.dart';
import 'package:modern_flutter_ui/ui/halamanutama1.dart';
import 'package:modern_flutter_ui/ui/httphomeprovider.dart';
import 'package:modern_flutter_ui/ui/httphomestateful.dart';
import 'package:modern_flutter_ui/ui/kost1splash.dart';
import 'package:modern_flutter_ui/ui/kost2home.dart';
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

import 'Providers/cobaauthenticationloginprovider.dart';

void main() {
  //NOTE: Device Orientation
  //agar device orientation bisa digunakan, harus ditambahkan widgetsFlutterBinding dulu
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
      //TIPS:selalu tambahkan provider notifier di main dart sebelum menggunakan provider.of
      providers: [
        ChangeNotifierProvider(create: (context) => AllProduct()),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => HttpModelProvider()),
        ChangeNotifierProvider(create: (context) => HttpGetProvider()),
        ChangeNotifierProvider(create: (context) => ProviderFirebase()),
        ChangeNotifierProvider(create: (context) => CobaKeyKuldiiProvider()),
        ChangeNotifierProvider(create: (context) => CobaCheckboxProvider()),
        ChangeNotifierProvider(create: (context) => CobaDropdownJilanModel()),
        ChangeNotifierProvider(
            create: (context) => CobaAuthenticationProvider()),
        ChangeNotifierProvider(
            create: (context) => CobaAuthenticationLoginProvider()),
        ChangeNotifierProvider(
            create: (context) => CobaSharedAndThemeProvider()),
        ChangeNotifierProvider(create: (context) => KostProvider()),
      ],
      //builder: (context, child) => MaterialApp(
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
          /* brightness: Brightness.dark,
          primaryColorDark: Colors.amber,
          primaryColor: Colors.cyan,
          primarySwatch: Colors.green,*/

          //colorScheme: ColorScheme.dark(primary: Colors.cyan),
          textTheme: GoogleFonts.poppinsTextTheme(),
          appBarTheme: AppBarTheme(
            color: Colors.green,
          ),
        ),
        //initialRoute: '/cobashayna',
        //home: CobaAuthenticationHome(),

        routes: {
          /*'/': (context) => FutureBuilder(
                future: Provider.of<CobaSharedAndThemeProvider>(context)
                    .getNumberSaved(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print(
                      'Future builder : ${Provider.of<CobaSharedAndThemeProvider>(context).number}');
                  return CobaSharedAndTheme();
                },
              ),*/
          '/': (context) => CobaLottie(),
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
          CobaState.nameRoute: (context) => CobaState(),
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
          '/cobahttpstateful': (context) => HttpStateful(),
          '/cobahttpprovider': (context) => HttpProvider(),
          '/firebaseapihome': (context) => FirebaseHome(),
          FirebaseDetail.nameRoute: (context) => FirebaseDetail(),
          CobaHalamanKosong.nameRoute: (context) => CobaHalamanKosong(),
          FirebaseFutureBuilder.nameRoute: (context) => FirebaseFutureBuilder(),
          '/cobakey': (context) => CobaKey(),
          CobaKeyKuldiiHome.nameRoute: (context) => CobaKeyKuldiiHome(),
          CobaKeyKuldiiAddData.nameRoute: (context) => CobaKeyKuldiiAddData(),
          '/cobacheckbox': (context) => CobaCheckbox(),
          '/cobadropdownjilan': (context) => CobaDropdownJilan(),
          '/cobaauthenticationlogin': (context) => CobaAutheticationLogin(),
          '/cobaauthenticationhome': (context) => CobaAuthenticationHome(),
          '/cobaauthenticationsignup': (context) => CobaAutheticationSignUp(),
          '/cobasharedpreferencesandtheme': (context) => CobaSharedAndTheme(),
          '/cobaanimation': (context) => CobaAnimation(),
          '/cobaanimationnavigator': (context) => CobaAnimationNavigator(),
          '/cobaanimatedbuilder': (context) => CobaAnimatedBuilder(),
          '/cobaanimationtween': (context) => CobaAnimationTween(),
          '/cobaclip': (context) => CobaClip(),
          'kost2home': (context) => KostHome(),
          'cobalottie': (context) => CobaLottie(),
        },
      ),
    );

    //ini adalah return main.dart untuk file cobaAuthentikasi
    /*return MultiProvider(
      //TIPS:selalu tambahkan provider notifier di main dart sebelum menggunakan provider.of
      providers: [
        ChangeNotifierProvider(
            create: (context) => CobaAuthenticationLoginProvider()),

        //NOTE:ChangeNotifierProvider (inisialisasi provider, sekalian mengupdate nilai/method yang ada di provider tersebut berdasarkan provider yang lain)
        //update: (context,value,previous){} (- value untuk nama dari provider yang lain, previous untuk nama provider yang digunakan)
        ChangeNotifierProxyProvider<CobaAuthenticationLoginProvider,
            CobaAuthenticationProvider>(
          create: (context) => CobaAuthenticationProvider(),
          //TIPS:make dua titik supaya bisa jalan
          update: (context, CobaAuthLogin, CobaAuth) => CobaAuth!
            ..updateToken(CobaAuthLogin.idToken, CobaAuthLogin.localId),
        ),

        //ChangeNotifierProvider(create: (context) => CobaAuthenticationProvider()),
      ],
      //builder: (context, child) => MaterialApp(
      child: Consumer<CobaAuthenticationLoginProvider>(
        builder: (context, dataAuthentication, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: GoogleFonts.poppinsTextTheme(),
              appBarTheme: AppBarTheme(
                color: Colors.green,
              ),
            ),
            routes: {
              '/': (context) => dataAuthentication
                      .isAuth //Tanpa navigator.push di button login juga bisa mengalihkan halaman secara otomatis
                  ? CobaAuthenticationHome()
                  : FutureBuilder(
                      future: dataAuthentication.autoLogin(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Scaffold(
                            body: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        return CobaAutheticationLogin();
                      },
                    ),
              '/cobaauthenticationlogin': (context) => CobaAutheticationLogin(),
              '/cobaauthenticationhome': (context) => CobaAuthenticationHome(),
              '/cobaauthenticationsignup': (context) => 
                  CobaAutheticationSignUp(),
            },
          );
        },
      ),
    );*/
  }
}
