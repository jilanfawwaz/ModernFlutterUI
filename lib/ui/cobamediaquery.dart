import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class CobaMediaQuery extends StatelessWidget {
  const CobaMediaQuery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width =
        MediaQuery.of(context).size.width; //ngambil ukuran lebar layar
    final _height =
        MediaQuery.of(context).size.height; //ngambil ukuran tinggi layar
    final _appBar = AppBar(
      title: Text("Responsive layout"),
    );
    //NOTE: MediaQuery Height
    final _bodyHeight = _height -
        _appBar.preferredSize.height - //ukuran appbar
        MediaQuery.of(context)
            .padding
            .top; //ukuran padding top untuk status bar seperti jam, baterai, wifi, dll

    final bool _isLandscape =
        //MediaQuery.of(context).orientation == DeviceOrientation.landscapeRight;
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: _appBar,
      /*body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.blue,
              width: _width * 0.3,
              height: _bodyHeight * 0.8,
              //NOTE: Layoutbuilder
              //NOTE: Constraint (-supaya bisa menggunakan constraint untuk mengambil ukuran dari parent (dalam baris ini parentnya adalah container))
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //constraints: BoxConstraints(maxWidth: 40),
                        width: constraints.maxWidth * 0.3,
                        height: constraints.maxHeight * 0.9,
                        color: Colors.amber,
                      ),
                      Container(
                        //constraints: BoxConstraints(maxWidth: 40),
                        width: constraints.maxWidth * 0.3,
                        height: constraints.maxHeight * 0.9,
                        color: Colors.amber,
                      ),
                      Container(
                        //constraints: BoxConstraints(maxWidth: 40),
                        width: constraints.maxWidth * 0.3,
                        height: constraints.maxHeight * 0.9,
                        color: Colors.amber,
                      ),
                      // LayoutBuilder(
                      //   builder: (context, constraints) {
                      //     return Container(
                      //       width: _width * 0.02,
                      //       height: constraints.maxHeight * 0.4,
                      //       color: Colors.amber,
                      //     );
                      //   },
                      // ),
                    ],
                  );
                },
              ),
            ),
            Container(
              color: Colors.blue,
              width: _width * 0.3,
              height: _bodyHeight * 0.8,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //constraints: BoxConstraints(maxWidth: 40),
                        width: constraints.maxWidth * 0.3,
                        height: constraints.maxHeight * 0.9,
                        color: Colors.amber,
                      ),
                      Container(
                        //constraints: BoxConstraints(maxWidth: 40),
                        width: constraints.maxWidth * 0.3,
                        height: constraints.maxHeight * 0.9,
                        color: Colors.amber,
                      ),
                      Container(
                        //constraints: BoxConstraints(maxWidth: 40),
                        width: constraints.maxWidth * 0.3,
                        height: constraints.maxHeight * 0.9,
                        color: Colors.amber,
                      ),
                      // LayoutBuilder(
                      //   builder: (context, constraints) {
                      //     return Container(
                      //       width: _width * 0.02,
                      //       height: constraints.maxHeight * 0.4,
                      //       color: Colors.amber,
                      //     );
                      //   },
                      // ),
                    ],
                  );
                },
              ),
            ),
            Container(
              color: Colors.blue,
              width: _width * 0.3,
              height: _bodyHeight * 0.8,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //constraints: BoxConstraints(maxWidth: 40),
                        width: constraints.maxWidth * 0.3,
                        height: constraints.maxHeight * 0.9,
                        color: Colors.amber,
                      ),
                      Container(
                        //constraints: BoxConstraints(maxWidth: 40),
                        width: constraints.maxWidth * 0.3,
                        height: constraints.maxHeight * 0.9,
                        color: Colors.amber,
                      ),
                      Container(
                        //constraints: BoxConstraints(maxWidth: 40),
                        width: constraints.maxWidth * 0.3,
                        height: constraints.maxHeight * 0.9,
                        color: Colors.amber,
                      ),
                      // LayoutBuilder(
                      //   builder: (context, constraints) {
                      //     return Container(
                      //       width: _width * 0.02,
                      //       height: constraints.maxHeight * 0.4,
                      //       color: Colors.amber,
                      //     );
                      //   },
                      // ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),*/

      /*body: Center(
        child: Container(
          width: _width * 0.9,
          height: _bodyHeight * 0.3,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width: _width * 0.25,
                    height: constraints.maxHeight * 0.5,
                    color: Colors.amber,
                  );
                },
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width: _width * 0.25,
                    height: constraints.maxHeight * 0.5,
                    color: Colors.amber,
                  );
                },
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width: _width * 0.25,
                    height: constraints.maxHeight * 0.5,
                    color: Colors.amber,
                  );
                },
              ),
            ],
          ),
        ),
      ),*/

      body: Center(
        child: _isLandscape
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: _bodyHeight * 0.3,
                    width: _width * 0.4,
                    color: Colors.blue,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: constraints.maxWidth * 0.3,
                              height: constraints.maxHeight * 0.8,
                              color: Colors.amber,
                            ),
                            Container(
                              width: constraints.maxWidth * 0.3,
                              height: constraints.maxHeight * 0.8,
                              color: Colors.amber,
                            ),
                            Container(
                              width: constraints.maxWidth * 0.3,
                              height: constraints.maxHeight * 0.8,
                              color: Colors.amber,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    height: _bodyHeight * 0.3,
                    width: _width * 0.4,
                    color: Colors.blue,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: constraints.maxWidth * 0.3,
                              height: constraints.maxHeight * 0.8,
                              color: Colors.amber,
                            ),
                            Container(
                              width: constraints.maxWidth * 0.3,
                              height: constraints.maxHeight * 0.8,
                              color: Colors.amber,
                            ),
                            Container(
                              width: constraints.maxWidth * 0.3,
                              height: constraints.maxHeight * 0.8,
                              color: Colors.amber,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: _bodyHeight * 0.2,
                    width: _width * 0.3,
                    color: Colors.blue,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: constraints.maxWidth * 0.8,
                              //width: 100,
                              height: constraints.maxHeight * 0.3,
                              color: Colors.amber,
                            ),
                            Container(
                              width: constraints.maxWidth * 0.8,
                              //width: 100,
                              height: constraints.maxHeight * 0.3,
                              color: Colors.amber,
                            ),
                            Container(
                              width: constraints.maxWidth * 0.8,
                              //width: 100,
                              height: constraints.maxHeight * 0.3,
                              color: Colors.amber,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    height: _bodyHeight * 0.2,
                    width: _width * 0.3,
                    color: Colors.blue,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: constraints.maxWidth * 0.8,
                              //width: 100,
                              height: constraints.maxHeight * 0.3,
                              color: Colors.amber,
                            ),
                            Container(
                              width: constraints.maxWidth * 0.8,
                              //width: 100,
                              height: constraints.maxHeight * 0.3,
                              color: Colors.amber,
                            ),
                            Container(
                              width: constraints.maxWidth * 0.8,
                              //width: 100,
                              height: constraints.maxHeight * 0.3,
                              color: Colors.amber,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: _width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 5,
                          child: Container(
                            height: 20,
                            color: Colors.blue,
                            child: Text("Haloo 1"),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: SizedBox(),
                        ),
                        Flexible(
                          //NOTE:Flexfit Flexible (- ketika dikasih flexible dan flexfit, ukuran container akan memenuhi ukuran row )
                          fit: FlexFit.tight,
                          //fit: FlexFit.loose,
                          flex: 15,
                          child: Container(
                            //width: 40, //kalau di row make flexible dan ada fit: , ukuran width akan diabaikan
                            height: 20,
                            color: Colors.red,
                            child: Text("Haloo 2"),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: SizedBox(),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          //fit: FlexFit.loose,
                          flex: 5,
                          child: Container(
                            height: 20,
                            color: Colors.amber,
                            child: Text("Haloo 3"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center, //kalau dikasih mainaxisalignment.center, space putih di kiri kana tetap punya simerah
                    children: [
                      Flexible(
                        //flexible bilang: hey container kamu isi satu layar, tapi kalau  ada container lain yang ditemenin ama flexible juga, lu bagi sama rata yaa jatah space nya... kalo containernya gaditemenin ama flexible ya lu kasih jatah sesuai width dia aja
                        fit: FlexFit
                            .tight, //jatah space gue gue mau isi sama warna gue, berati si width kacangin aja
                        child: Container(
                          height: 20,
                          width: 20, //karena ada flexfit.tight width dikacangin
                          color: Colors.blue,
                        ),
                      ),
                      Flexible(
                        //nih gue flexible juga, tapi
                        fit: FlexFit
                            .loose, //(- default fit dari flexible, gaditulis sebenarnya gapapa) jatah space gue mau putih aja ah, lebar warnanya sesuai width aja, jatah putihnya kalau ada container lain ditaroh dibelakang aja
                        child: Container(
                          height: 20,
                          width: 20,
                          color: Colors.red,
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          height: 20,
                          //width: 20, //flexible kalau gadikasih width, maka secara default akan dijadikan fit: flexfit.tight
                          color: Colors.amber,
                        ),
                      ),
                      //Flexible(fit: flexfit.tight) bisa ditulis lebih pendek menjadi expanded()
                      Expanded(
                        child: Container(
                          height: 20,
                          color: Colors.green,
                        ),
                      ),
                      //space kosong di paling belakang ini adalah jatah space punya si merah
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
