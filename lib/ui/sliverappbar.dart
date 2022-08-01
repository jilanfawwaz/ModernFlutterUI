import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Theme(
            data: ThemeData(
              appBarTheme: AppBarTheme(
                color: Colors.blue,
              ),
            ),
            child: SliverAppBar(
              //pinned: kalau udah discroll, app bar mau stay di atas gak?
              pinned: false,
              //floating: kalau misalkan appbar udah hilang karena di scroll, kalau discroll keatas lagi appbarnya mau langsung ditampilin gak?
              floating: true,
              //snap: kalau misal floating true, ketika scroll dinaikin dikit aja, appbar langsung kelihatan full, jadi gak sedikit demi sedikit
              snap: false, //kalau snap true, floating harus true biar ga eror

              //ini kaya AppBar biasa
              expandedHeight: 160,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
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
            prototypeItem: Text(
              'Test',
              textScaleFactor: 5,
            ),
          ),
        ],
      ),
    );
  }
}
