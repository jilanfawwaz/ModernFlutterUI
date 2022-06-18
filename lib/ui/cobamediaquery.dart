import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: Center(
        child: _isLandscape
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: _bodyHeight * 0.3,
                    width: _width * 0.4,
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.amber,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: _bodyHeight * 0.3,
                    width: _width * 0.4,
                    color: Colors.blue,
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: _bodyHeight * 0.4,
                    width: _width * 0.3,
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Container(
                              width: constraints.maxWidth * 0.8,
                              height: 100,
                              color: Colors.amber,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: _bodyHeight * 0.4,
                    width: _width * 0.3,
                    color: Colors.blue,
                  ),
                ],
              ),
      ),
    );
  }
}
