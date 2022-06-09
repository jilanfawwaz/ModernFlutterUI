//import 'dart:ui';

import 'package:flutter/material.dart';

class CobaMap extends StatelessWidget {
  CobaMap({Key? key}) : super(key: key);

  final List<Widget> listWidget = [
    Container(
      child: CircleAvatar(),
    ),
    Text("data"),
    Container(
      child: CircleAvatar(),
    ),
    Container(
      child: CircleAvatar(),
    ),
    Container(
      child: CircleAvatar(),
    ),
  ];

  final List<Map<String, dynamic>> listMap = [
    {
      "nama": "jilan fawwaz",
      "umur": 23,
      "makananfavorit": ["pisang", "mangga", "durian", "kiwi"]
    },
    {
      "nama": "cakrawala persada",
      "umur": 20,
      "makananfavorit": [
        "alpukat",
        "semangka",
        "melon",
        "alpukat",
        "semangka",
        "melon",
        "alpukat",
        "semangka",
        "melon"
      ]
    },
    {
      "nama": "Anugrah Samudra",
      "umur": 25,
      "makananfavorit": ["alpukat", "rambutan"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba MAP"),
      ),
      body: SafeArea(
        child: Center(
          //child: Column(children: listWidget),
          child: Column(
            children: listMap.map((e) {
              print(e['makananfavorit']);
              List makananfavorit = e['makananfavorit'];
              return Card(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e['nama']),
                    Text("umur : ${e['umur']}"),
                    Text(e['umur'].toString()),
                    Text("${e['makananfavorit'].length}"),
                    Text(e['makananfavorit'][1]),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: makananfavorit
                            .map((e) => Container(
                                  color: Colors.blue,
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.all(10),
                                  child: Text("${e} "),
                                ))
                            .toList(),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
