import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CobaKeyKuldiiWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final DateTime date;

  const CobaKeyKuldiiWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.date})
      : super(key: key);

  @override
  State<CobaKeyKuldiiWidget> createState() => _CobaKeyKuldiiWidgetState();
}

class _CobaKeyKuldiiWidgetState extends State<CobaKeyKuldiiWidget> {
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

  late Color myColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myColor = randomColor[Random().nextInt(randomColor.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: myColor,
      ),
      title: Text(widget.title),
      subtitle: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.subtitle),
          Text(DateFormat.yMMMEd().format(widget.date)),
          //Text(DateFormat().add_yMMMEd().format(widget.date)),
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.delete),
      ),
    );
  }
}
