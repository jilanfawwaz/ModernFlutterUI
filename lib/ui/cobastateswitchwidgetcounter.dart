import 'package:flutter/material.dart';

class CobaStateWidgetCounter extends StatefulWidget {
  const CobaStateWidgetCounter({
    Key? key,
    required this.numberButton,
  }) : super(key: key);

  final int numberButton;

  @override
  State<CobaStateWidgetCounter> createState() => _CobaStateWidgetCounterState();
}

class _CobaStateWidgetCounterState extends State<CobaStateWidgetCounter> {
  @override
  void didUpdateWidget(covariant CobaStateWidgetCounter oldWidget) {
    //yang bisa diprint di oldwidget adalah constructor
    //print(oldWidget.numberButton);
    super.didUpdateWidget(oldWidget);
    //yang ini print angka sekarang
    //print(widget.numberButton);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.numberButton.toString(),
      style: TextStyle(
        //NOTE:double.parse (mengubah int menjadi double)
        fontSize: 30 + double.parse(widget.numberButton.toString()),
      ),
    );
  }
}
