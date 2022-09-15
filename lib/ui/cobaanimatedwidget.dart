import 'package:flutter/material.dart';
import 'dart:math' as math;
//! Done Screen G.Doc


//NOTE:Animated Widget
//class nanti dipanggil di animatedbuildercontroller.dart
//! Dialog DONE G.DOC
class CobaAnimatedWidget extends AnimatedWidget {
  final  animation;

  //NOTE:Listenable
  const CobaAnimatedWidget({Key? key, this.animation})
      : super(key: key, listenable: animation);

  //TIPS: pake getter buat variasi aja, 
  //gak pake ini langsung ngambil value dari variabel animation juga gapapa kok
  get _progress {
    return listenable as Animation<double>;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      // angle: animation.value * math.pi,
      angle: _progress.value * math.pi,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.amber,
        child: const Text('WIDGET'),
      ),
    );
  }
}
