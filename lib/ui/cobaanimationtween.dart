import 'package:flutter/material.dart';
//! Done Screen G.Doc

// import 'dart:math' as math;
//! penjelasan ada di kuldii no. 104 (Decorated Box Transition)
class CobaAnimationTween extends StatefulWidget {
  const CobaAnimationTween({Key? key}) : super(key: key);

  @override
  State<CobaAnimationTween> createState() => _CobaAnimationTweenState();
}

class _CobaAnimationTweenState extends State<CobaAnimationTween>
    with TickerProviderStateMixin {
  //! bisa ditambahkan Tween<Decoration> didepannya
  //final Tween<Decoration> _decorationTween = DecorationTween(
  final DecorationTween _decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.circular(40),
    ),
    end: BoxDecoration(
      color: Colors.green,
      boxShadow: [
        BoxShadow(
          color: Colors.blue.withOpacity(0.5),
          blurRadius: 10,
          spreadRadius: 3,
          offset: Offset(0, 6),
        )
      ],
    ),
  );

  //AnimationController
  late final AnimationController _controller =
      AnimationController(duration: Duration(milliseconds: 3000), vsync: this)
        ..repeat(reverse: true);

  /*late final AnimationController _controller2 =
      AnimationController(duration: Duration(milliseconds: 500), vsync: this)
        ..repeat(reverse: true);*/

  late final AnimationController _controller2 = AnimationController(
      duration: Duration(milliseconds: 2000),
      reverseDuration: Duration(milliseconds: 1000),
      vsync: this)
    ..repeat(reverse: true);

  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _controller2,
    curve: Curves.easeInOutBack,
    reverseCurve: Curves.bounceIn,
  );

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coba Animation Tween'),
      ),
      body: Center(
        //NOTE:DecoratedBoxTransition untuk membuat animasi buat boxdecoration
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DecoratedBoxTransition(
              decoration: _decorationTween.animate(_controller),
              child: Container(
                width: 200,
                height: 200,
                child: Center(
                  child: Text('Decoration Box Animation'),
                ),
              ),
            ),
            FadeTransition(
              //opacity: (_controller.value as Animation<double>),
              opacity: _fadeAnimation,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
              ),
            ),
            FadeTransition(
              opacity: _controller2,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
