import 'package:flutter/material.dart';
//! Done Screen G.Doc

//! AnimatedBuilder using Scale DONE G.DOC
class CobaAnimatedBuilderScale extends StatefulWidget {
  const CobaAnimatedBuilderScale({Key? key}) : super(key: key);

  @override
  State<CobaAnimatedBuilderScale> createState() =>
      _CobaAnimatedBuilderScaleState();
}

class _CobaAnimatedBuilderScaleState extends State<CobaAnimatedBuilderScale>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: 3000),
    vsync: this,
  )..repeat(reverse: true);
  //NOTE:Titik Dua (..) ini fungsinya supaya tidak harus menuliskan program dua kali (_controller.repeat()), jadi bisa disingkat dalam satu baris
  // dan karena variabel diatas adalah variabel late, jadi titik dua juga berfungsi supaya fungsi dipanggil setelah inisialisasi, mirip2 .then lah pokonya

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.cyan,
        child: Center(
          child: Text('Besarrr'),
        ),
      ),
      builder: (context, child) {
        return Transform.scale(
          scale: _controller.value,
          child: child,
        );
      },
    );
  }
}
