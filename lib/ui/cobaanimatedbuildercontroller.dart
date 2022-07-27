import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:modern_flutter_ui/ui/cobaanimatedwidget.dart';

class CobaAnimatedBuilderController extends StatefulWidget {
  @override
  State<CobaAnimatedBuilderController> createState() =>
      _CobaAnimatedBuilderControllerState();
}

class _CobaAnimatedBuilderControllerState
    extends State<CobaAnimatedBuilderController> with TickerProviderStateMixin {
  //controller.value berisi nilai dengan rentang nilai 0 sampai 1
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //NOTE:Tween() untuk memberi patokan mulai dan selesai pada animasi
    final  _animation =
        Tween(begin: 90 / 180 * math.pi, end: 2 * math.pi).animate(_controller);
    //print(_controller.value);
    return Column(
      children: [
        AnimatedBuilder(
          animation: _animation,
          child: Column(
            children: [
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: const Center(
                  child: Text('Whee!'),
                ),
              ),
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: const Center(
                  child: Text('Whee 2!'),
                ),
              ),
            ],
          ),
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              /*angle: _controller.value *
                  (270 / 180) *
                  math.pi,*/ // pi bernilai 180 derajat, makanya dikali 2 supaya bisa 360 derajat
              angle: _animation.value.toDouble(),
              child: child,
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        CobaAnimatedWidget(
          animation: _controller,
        ),
      ],
    );
  }
}
