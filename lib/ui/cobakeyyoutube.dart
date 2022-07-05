import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class CobaKeyYoutube extends StatefulWidget {
  const CobaKeyYoutube({Key? key}) : super(key: key);

  @override
  State<CobaKeyYoutube> createState() => _CobaKeyYoutubeState();
}

class _CobaKeyYoutubeState extends State<CobaKeyYoutube> {
  /*List<Widget> _tilesStateless = [
    StatelessProjectTiles(),
    StatelessProjectTiles(),
  ];*/

  List<Widget> _tilesStateful = [
    StatefulProjectTiles(key: UniqueKey()),
    StatefulProjectTiles(key: UniqueKey()),
  ];

  //TIPS:Key harus ditaroh di bagian paling awal subtree (dalam kasus ini padding)
  /*List<Widget> _tilesStateful = [
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatefulProjectTiles(),
    ),
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatefulProjectTiles(),
    ),
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Key Youtube"),
      ),

      //NOTE:Wrap (sama kaya row tapi bakal ngeexpand kebawah dan gaoverflow)
      body: Row(
        children: _tilesStateful,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit_rounded),
        onPressed: swapTiles,
      ),
    );
  }

  swapTiles() {
    setState(() {
      //NOTES: Widget swap menggunakan insert
      _tilesStateful.insert(
        0,
        _tilesStateful.removeAt(1),
        //yang dimasukkan ke tile adalah yang diremove, bukan yang ada di dalam list saat ini
      );
      //ijo kuning, hapus [0] sisa kuning tapi yang keluar ijo, ijo dimasukkan sebelum 1 (setelah kuning), jadi ketuker deh

      //_tilesStateful.removeAt(0);
    });
  }
}

class StatelessProjectTiles extends StatelessWidget {
  //StatelessProjectTiles({Key? key}) : super(key: key);
  final List<Color> randomColor = [
    Colors.amber,
    Colors.green,
    Colors.blue,
    Colors.black,
    Colors.grey,
    Colors.cyan,
    Colors.brown,
    Colors.lime,
    Colors.purple
  ];

  //Color myColor =Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  //TIPS: kita tidak dapat menginisialisasi variabel randomColor atau variabel lain sebelum randomColor tersebut diinisialisasi, solusi tambahkan late
  late Color myColor = randomColor[Random().nextInt(randomColor.length)];

  //TIPS: kalau yang diinisialisasi langsung method, gaperlu make late, late cuma buat inisialisasi variabel yang nilainya masih akan diproses
  //Color myColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: myColor,

      //kalo langsung diinisialisasi ke color, maka warna akan ke random terus
      //color: randomColor[Random().nextInt(randomColor.length)],
    );
  }
}

class StatefulProjectTiles extends StatefulWidget {
  StatefulProjectTiles({Key? key}) : super(key: key);

  @override
  State<StatefulProjectTiles> createState() => _StatefulProjectTilesState();
}

class _StatefulProjectTilesState extends State<StatefulProjectTiles> {
  final List<Color> randomColor = [
    Colors.amber,
    Colors.green,
    Colors.blue,
    Colors.black,
    Colors.grey,
    Colors.cyan,
    Colors.brown,
    Colors.lime,
    Colors.purple
  ];

  //Color myColor = _randomColor[Random().nextInt(_randomColor.length)];
  late Color myColor = randomColor[Random().nextInt(randomColor.length)];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: myColor,
      //color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
    );
  }
}
