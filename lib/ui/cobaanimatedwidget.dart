import 'package:flutter/material.dart';
import 'dart:math' as math;

class CobaAnimatedWidget extends AnimatedWidget {
  final animation;
  CobaAnimatedWidget({Key? key, this.animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: animation.value * math.pi,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.amber,
        child: Text('WIDGET'),
      ),
    );
  }
}
