import 'dart:math';

import 'package:flutter/material.dart';

class CobaKeyYoutube extends StatefulWidget {
  const CobaKeyYoutube({Key? key}) : super(key: key);

  @override
  State<CobaKeyYoutube> createState() => _CobaKeyYoutubeState();
}

class _CobaKeyYoutubeState extends State<CobaKeyYoutube> {
  List<Widget> _tiles = [
    StatelessProjectTiles(),
    StatelessProjectTiles(),
  ];

  List<Widget> _tilesStateful = [
    // StatefulProjectTiles(),
    // StatefulProjectTiles(),
    Container(
      height: 100,
      width: 100,
      color: Colors.green,
    ),
    Container(
      height: 100,
      width: 100,
      color: Colors.amber,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Key Youtube"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            //NOTES: Widget swap menggunakan insert
            _tilesStateful.insert(
              1,
              _tilesStateful.removeAt(0),
            );
            //ijo kuning, hapus [0] ijo sisa kuning, masukkan kuning sebelum 1,
            //masukkan di index sebelum ke 1 -> remove tile dari index ke 0
            //_tilesStateful.removeAt(0);
          });
        },
        child: Icon(Icons.ac_unit_rounded),
      ),
      //NOTE:Wrap (sama kaya row tapi bakal ngeexpand kebawah dan gaoverflow)
      body: Wrap(
        children: _tilesStateful,
      ),
    );
  }
}

class StatelessProjectTiles extends StatelessWidget {
  StatelessProjectTiles({Key? key}) : super(key: key);
  final List<Color> _randomColor = [
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: _randomColor[Random().nextInt(_randomColor.length)],
    );
  }
}

class StatefulProjectTiles extends StatefulWidget {
  StatefulProjectTiles({Key? key}) : super(key: key);

  @override
  State<StatefulProjectTiles> createState() => _StatefulProjectTilesState();
}

class _StatefulProjectTilesState extends State<StatefulProjectTiles> {
  final List<Color> _randomColor = [
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: _randomColor[Random().nextInt(_randomColor.length)],
    );
  }
}
