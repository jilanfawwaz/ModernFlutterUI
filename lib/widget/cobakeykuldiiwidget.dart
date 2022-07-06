import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modern_flutter_ui/Providers/cobakeykuldiprovider.dart';
import 'package:provider/provider.dart';

class CobaKeyKuldiiWidget extends StatefulWidget {
  final String id;
  final String title;
  final String subtitle;
  final DateTime date;

  const CobaKeyKuldiiWidget(
      {Key? key,
      required this.id,
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
  // Color myColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myColor = randomColor[Random().nextInt(randomColor.length)];
  }

  @override
  Widget build(BuildContext context) {
    final cobaKeyProvider =
        Provider.of<CobaKeyKuldiiProvider>(context, listen: false);
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
        onPressed: () {
          cobaKeyProvider.removeData(widget.id);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}
