import 'dart:math';

import 'package:flutter/material.dart';

class CobaKey extends StatefulWidget {
  const CobaKey({Key? key}) : super(key: key);

  @override
  State<CobaKey> createState() => _CobaKeyState();
}

class _CobaKeyState extends State<CobaKey> {
  final List<Map<String, dynamic>> _dataList = [
    {'name': "Jilan", 'pekerjaan': "programmer"},
    {'name': "jidan", 'pekerjaan': "Bondeng Warior"},
    {'name': "jidan", 'pekerjaan': "Bondeng Warior"},
    {'name': "jidan", 'pekerjaan': "Bondeng Warior"},
    {'name': "jidan", 'pekerjaan': "Bondeng Warior"},
  ];

  @override
  Widget build(BuildContext context) {
    //TIPS: Random Color
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Key"),
      ),
      body: ListView.separated(
        itemCount: _dataList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            key: ValueKey(index.toString()),
            leading: CircleAvatar(
              key: ValueKey(index.toString()),
              backgroundColor:
                  _randomColor[Random().nextInt(_randomColor.length)],
            ),
            title: Text(
              _dataList[index]['name'],
            ),
            subtitle: Text(_dataList[index]['pekerjaan']),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _dataList.remove(_dataList[index]);
                  print(_dataList);
                });
              },
              icon: Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
