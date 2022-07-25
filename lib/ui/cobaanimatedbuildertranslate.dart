import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CobaAnimatedBuilderTranslate extends StatefulWidget {
  const CobaAnimatedBuilderTranslate({Key? key}) : super(key: key);

  @override
  State<CobaAnimatedBuilderTranslate> createState() =>
      _CobaAnimatedBuilderTranslateState();
}

class _CobaAnimatedBuilderTranslateState
    extends State<CobaAnimatedBuilderTranslate> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(milliseconds: 2000), vsync: this)
        ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: Center(child: Text('Jalann')),
      ),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(100 * _controller.value, 100),
          child: child,
        );
      },
    );
  }
}
