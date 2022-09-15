import 'package:flutter/material.dart';
//! Done Screen G.Doc

class CobaCustomPaint extends StatelessWidget {
  const CobaCustomPaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coba Custom Paint'),
      ),
      body: Center(
        child: SizedBox(
          height: 250,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                //Custom Paint pertama
                Container(
                  width: 300,
                  height: 200,
                  margin: EdgeInsets.only(
                    right: 60,
                    left: 30,
                  ),
                  color: Colors.amber.withOpacity(0.5),
                  child: CustomPaint(
                    painter: CobaPainter(),
                  ),
                ),

                //Custom Paint kedua
                Container(
                  width: 300,
                  height: 200,
                  margin: EdgeInsets.only(
                    right: 40,
                  ),
                  color: Colors.amber.withOpacity(0.5),
                  child: CustomPaint(
                    painter: CobaPainter2(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//NOTE:CustomPainter untuk menggambar tapi custom
class CobaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /*Paint linePaint = Paint();
    linePaint.color = Colors.blue;
    linePaint.strokeWidth = 30;
    linePaint.strokeCap = StrokeCap.round;*/

    //Paint nanti dimasukkan ke paint di canvas.drawline (dibawah)
    Paint linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 30
      ..strokeCap = StrokeCap.round;

    Paint linePaintRed = Paint()
      ..color = Colors.red
      ..strokeWidth = 30
      ..strokeCap = StrokeCap.square;
    //..blendMode = BlendMode.dstOut;

    canvas.drawLine(Offset(0, 0), Offset(0, size.height), linePaint);
    canvas.drawLine(
        Offset(0, size.height), Offset(size.width, size.height), linePaint);

    canvas.drawLine(Offset(size.width, size.height), Offset(0, 0), linePaint);
    //Yang ini paint nya dari variabel
    //canvas.drawLine(Offset(size.width, 0),Offset(size.width / 2, size.height / 2), linePaintRed);

    //yang ini paintnya langsung dimasukin kedalam
    canvas.drawLine(
        Offset(size.width, 0),
        Offset(size.width / 2, size.height / 2),
        Paint()
          ..color = Colors.red
          ..strokeWidth = 30
          ..strokeCap = StrokeCap.round);
  }

  @override
  bool shouldRepaint(CobaPainter oldDelegate) => false;

  // @override
  // bool shouldRebuildSemantics(CobaPainter oldDelegate) => false;
}

class CobaPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint()..color = Colors.red;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 3, circlePaint);
  }

  
  @override
  bool shouldRepaint(CobaPainter2 oldDelegate) => false;

  // @override
  // bool shouldRebuildSemantics(CobaPainter2 oldDelegate) => false;
}
