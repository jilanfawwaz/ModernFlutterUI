import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:modern_flutter_ui/shared/theme.dart';
//! Done Screen G.Doc

class CobaSliverAppBar extends StatelessWidget {
  CobaSliverAppBar({Key? key}) : super(key: key);

  final List<Widget> _dataList = List.generate(
    5,
    (index) => Container(
      height: 100,
      color: Colors.amber[100 * (index % 9)],
      child: Image.network(
        "https://picsum.photos/id/${index + 20}/200/300",
        // fit: BoxFit.cover,
      ),
    ),
  );

  static List<Widget> _dataSliverGrid = List.generate(20, (index) {
    return Container(
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      child: Center(
        child: textWithStroke(
          text: '${index + 1}',
          fontSize: 50,
          strokeWidth: 7,
        ),
      ),
      //color: Colors.blue,
    );
  });

  static Widget textWithStroke(
      {required String text,
      double fontSize = 12,
      double strokeWidth = 1,
      Color textColor = Colors.white,
      Color strokeColor = Colors.black}) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Theme(
            data: ThemeData(
              appBarTheme: const AppBarTheme(
                color: Colors.blue,
              ),
            ),
            //NOTES:SliverAppBar, appbar bisa dikasih background warna, kalau di scroll appbarnya bisa mengecil atau menghilang
            child: SliverAppBar(
              //pinned: kalau udah discroll, app bar mau stay di atas gak?
              pinned: true,
              //floating: kalau misalkan appbar udah hilang karena di scroll, kalau discroll keatas lagi appbarnya mau langsung ditampilin gak?
              floating: true,
              //snap: kalau misal floating true, ketika scroll dinaikin dikit aja, appbar langsung kelihatan full, jadi gak sedikit demi sedikit
              snap: false, //kalau snap true, floating harus true biar ga eror

              //expandedHeight tinggi dari flexible space barnya
              expandedHeight: 160,
              //collapsedHeight usahakan nilainya lebih kecil dari expandedHeight, ini untuk tinggi appbar yang ke pinned (pinned harus true)
              //collapsedHeight: 100,
              //ini kaya AppBar biasa
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Coba SliverAppBar',
                ),
                background: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    'assets/images/kost2city5.png',
                    fit: BoxFit.cover,
                    color: Colors.blue,
                    colorBlendMode: BlendMode.color,
                  ),
                ),
              ),
            ),
          ),

          /*SliverPersistentHeader(
            delegate: SliverPersistentClass(),
            pinned: true,
            floating: true,
          ),*/

          SliverPersistentHeader(
            delegate: SliverPersistentClassKedua(
              minExtent: 100,
              maxExtent: 200,
            ),
            pinned: true,
          ),

          //===========================================================================================================================

          //TIPS: SliverGrid bisa menggunakan SliverGrid() tapi harus menggunakan delegate, atau shortcut SliverGrid.count() tapi listnya harus disiapkan terlebih dahulu
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  'SliverGrid  dengan gridDelegate: SliverGridDelegateWithFixedCrossAxisExtent',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
                  child: Center(
                    child: textWithStroke(
                      text: '${index + 1}',
                      fontSize: 50,
                      strokeWidth: 7,
                    ),
                  ),
                  //color: Colors.blue,
                );
              },
              childCount: 20,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8,

              //mainAxisExtent: panjang default dari tiap tile grid
              // mainAxisExtent: 300,

              //childAspectRatio: 3,
            ),
          ),

          //Shortcut Program
          /*SliverGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: _dataSliverGrid,
            childAspectRatio: 0.8,
          ),*/

          //===========================================================================================================================

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  'SliverGrid dengan gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          /*SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
                  child: Center(
                    child: textWithStroke(
                      text: '${index + 1}',
                      fontSize: 50,
                      strokeWidth: 7,
                    ),
                  ),
                  //color: Colors.blue,
                );
              },
              childCount: 20,
            ),
            // ketika menggunakan SliverGridDelegateWithMaxCrossAxisExtent, ada argument maxCrossAxisExtent: yang berfungsi untuk membagi jumlah crossAxisCount berdasarkan besar pixel
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              //maxCrossAxisExtent adalah maksimal lebar pixel
              maxCrossAxisExtent: 80,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
          ),*/

          SliverGrid.extent(
            maxCrossAxisExtent: 80,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.8,
            children: _dataSliverGrid,
          ),

          /*SliverGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: _dataSliverGrid,
            childAspectRatio: 0.8,
          ),*/

          //===========================================================================================================================
          //SliverToBoxAdapter adalah body dari slivernya, kita bisa memasukkan widget apa aja ke dalam box body ini, bisa juga gamake sliverView() dan diganti dengan make box ini diisi dengan listview
          SliverPersistentHeader(
            delegate: SliverPersistentClassKedua(
              minExtent: 100,
              maxExtent: 200,
            ),
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              //height: 50,
              child: Center(
                child: Text(
                  'SliverChildBuilderDelegate, sama seperti listview.builder, bisa memasukkan jumlah ke dalam childCount:',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SliverList(
            // SliverChildBuilderDelegate sama seperti listview.builder, bisa memasukkan jumlah ke dalam childCount:
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      //NOTES:TextScaleFactor
                      textScaleFactor: 5,
                    ),
                  ),
                );
              },
              childCount: 5,
            ),
          ),

          //===========================================================================================================================
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(
                    'SliverChildListDelegate, memasukkan list seperti biasa'),
              ),
            ),
          ),
          SliverList(
            //kalau data list fixed/tidak ada perubahan, bisa menambahkan .fixed
            // delegate: SliverChildListDelegate.fixed(_dataList),
            delegate: SliverChildListDelegate(_dataList),
          ),

          //===========================================================================================================================
          const SliverToBoxAdapter(
            child: SizedBox(
              //height: 50,
              child: Center(
                child: Text(
                  'SliverFixedExtentList -> SliverChildListDelegate, ada parameter itemextent yang berfungsi untuk mengatur panjang/height itemlist',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildListDelegate(_dataList),
            itemExtent: 150,
          ),

          //===========================================================================================================================
          const SliverToBoxAdapter(
            child: SizedBox(
              //height: 50,
              child: Center(
                child: Text(
                  'SliverPrototypeExtentList -> SliverChildListDelegate, ada parameter prototypeItem: untuk menjadikan sebuah widget sebuah patokan ukuran',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SliverPrototypeExtentList(
            delegate: SliverChildListDelegate(_dataList),
            prototypeItem: const Text(
              'Test',
              textScaleFactor: 5,
            ),
          ),

          //===========================================================================================================================
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  'SliverToBoxAdapter juga bisa dimasukkan list',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: ListView(
                children: _dataList,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverPersistentClass extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ListView(
      padding: EdgeInsets.zero,
      children: CobaSliverAppBar._dataSliverGrid,
    );
  }

//maxExtent panjang maksimal extends sebelum menciut
  @override
  double get maxExtent => 200;

//minExtent panjang minimal extends setelah menciut
  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class SliverPersistentClassKedua extends SliverPersistentHeaderDelegate {
  final double maxExtent;
  final double minExtent;
  SliverPersistentClassKedua(
      {required this.maxExtent, required this.minExtent});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(shrinkOffset);
    return Container(
      color: Colors.amber,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/kost2city2.png',
            fit: BoxFit.cover,
            color: Colors.amber,
            colorBlendMode: BlendMode.difference,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.blue,
                  Colors.transparent,
                  Colors.green,
                  Colors.transparent,
                  Colors.black,
                ],
                //stops:
                //jumlah list stops harus sama dengan jumlah list colors
                //skala stops dari rentang nilai 0 sampai 1, yang melambangkan height dari containernya

                stops: [
                  0,
                  0.3, //dari warna transparent ke blue tingginya 0.3 skala tinggi container, dimulai dari 0
                  0.4, //dari warna blue ke transparent tingginya 0.1 skala tinggi container (0.4 dikurangi 0.3), dimulai dari tinggi 0.3
                  0.6,
                  0.7,
                  1,
                ],

                //Argument buat LinearGradient()
                // begin: Alignment(0, -0.3),
                // end: Alignment(0, 0.3),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                //tileMode: untuk memberikan mode warna pada bagian yang gamasuk ke dalam gradient (sebelum begin dan setelah end)
                tileMode: TileMode.repeated,

                //Argument buat RadialGradient()
                // center: Alignment.center,
                // radius: 0.8,
                // focal:
                //     Alignment.bottomCenter, //titik tengahnya mau ditaroh dimana
                // focalRadius: 0.3,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                shrinkOffset > 100
                    ? 'Scroll keatas untuk melihat text'
                    : 'Sliver Persistent mirip Sliver Appbar',
                style: shrinkOffset > 100
                    ? cPoppinsWhiteMedium18.copyWith(fontSize: 10)
                    : cPoppinsWhiteMedium18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // double get maxExtent => 300;

  // @override
  // double get minExtent => 150;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
