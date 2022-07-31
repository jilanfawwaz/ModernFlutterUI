import 'package:flutter/material.dart';

class CobaClip extends StatelessWidget {
  const CobaClip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coba Clip'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Text('ClipPath'),
              ClipPath(
                clipper: ClipperPath(),
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.amber,
                  child: Image.asset(
                    'assets/images/2-cardImage2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text('ClipRRect'),
              ClipRRect(
                //borderRadius: BorderRadius.circular(50),

                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.amber,
                  child: Image.asset(
                    'assets/images/2-cardImage2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text('ClipOval'),
              ClipOval(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset(
                    'assets/images/2-cardImage2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Gambar Asli'),
              Container(
                width: 200,
                height: 200,
                color: Colors.amber,
                child: Image.asset(
                  'assets/images/2-cardImage2.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text('ClipRect'),
              ClipRect(
                child: Align(
                  heightFactor: 0.75,
                  widthFactor: 0.5,
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 200,
                    height: 200,
                    //alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/2-cardImage2.png'),
                      ),
                    ),
                  ),
                ),
              ),
              ClipRect(
                child: Align(
                  heightFactor: 0.75,
                  widthFactor: 0.5,
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.amber,
                    child: Image.asset(
                      'assets/images/2-cardImage2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


//NOTE:Custom Clip, untuk membuat frame masking dengan path custom
class ClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //potong segitiga siku2
    //cara baca program dibawah, dari titik koordinat awal (0,0) (- boleh gausah ditulis, kalau mau diubah pake move to)
    //ke koordinat (0,200), 200 adalah height dari child
    //ke koordinat (200,200), 200 adalah height dan width dari child
    //lalu tutup/close otomatis ke titik awal yaitu (0.0)

    /*Path path = Path()
      ..lineTo(0, size.height) // Add line p1p2 
      ..lineTo(size.width, size.height) // Add line p2p3
      ..close();*/

    //potong trapesium
    /*Path path = Path()
      ..lineTo(0, size.height) // Add line p1p2
      ..lineTo(100, size.height) // Add line p2p3
      ..lineTo(100, 100)
      ..close();*/

    //potong bentuk rumah
    //move to untuk mengganti titik koordinat awal
    /*Path path = Path()
      ..moveTo(100, 0)
      ..lineTo(0, 50) // Add line p1p2
      ..lineTo(0, size.height) // Add line p2p3
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 50)
      ..close();*/

    //potong melengkung
    //quadraticBezierTo(titikLengkungX,titikLengkungY,titikLineToX, titikLineToY)

    //offset adalah titik koordinat x y
    var controlPoint = Offset(50, 150);
    var endPoint = Offset(size.width, size.height);

    Path path = Path()
      ..lineTo(0, size.height) // Add line p1p2
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..close();

    print(size.height);
    print(size.width);

    return path;
  }


  //shouldreclip ini katanya fungsinya, kalau canvas container ukurannya berubah, apakah clip mau digambar ulang atau ngga, kalau mau return true, ngga return false
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


