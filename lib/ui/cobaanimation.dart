import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/ui/cobastateswitch.dart';
//! Done Screen G.Doc

class CobaAnimation extends StatefulWidget {
  const CobaAnimation({Key? key}) : super(key: key);

  @override
  State<CobaAnimation> createState() => _CobaAnimationState();
}

class _CobaAnimationState extends State<CobaAnimation> {
  bool animation1 = false;
  bool animation2 = false;
  bool animation3 = false;
  bool animation4 = false;
  bool animation5 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Coba Animation'),
      ),*/
      body: Container(
        //width: 100,
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                //! AnimatedPositioned DONE G.DOC
                Text(
                  'AnimatedPositioned',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      animation5 = !animation5;
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        color: Colors.green,
                        child: Center(child: Text('Hello')),
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 800),
                        top: animation5 ? 100 : 60,
                        curve: Curves.easeInOutBack,
                        left: 40,
                        child: Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              color: Colors.amber),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                //! AnimatedContainer DONE G.DOC
                Text(
                  'AnimatedContainer',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      animation1 = !animation1;
                      Timer(
                        Duration(milliseconds: 900),
                        () {
                          //Navigator.pushNamed(context, CobaState.nameRoute);
                        },
                      );
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 700),
                    curve: Curves.easeInOutBack,
                    width: animation1 ? 100 : 200,
                    height: animation1 ? 100 : 125,
                    decoration: BoxDecoration(
                      color: animation1 ? Colors.blue : Colors.amber,
                      borderRadius: BorderRadius.circular(
                        animation1 ? 0 : 40,
                      ),
                    ),
                    child: AnimatedAlign(
                      duration: Duration(milliseconds: 900),
                      curve: Curves.easeInOutBack,
                      alignment: animation1
                          ? Alignment.topLeft
                          : Alignment.centerRight,
                      child: Container(
                        width: animation1 ? 30 : 40,
                        height: animation1 ? 30 : 40,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //! AnimatedAlign DONE G.DOC
                Text(
                  'AnimatedAlign',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: AnimatedAlign(
                    alignment: animation2
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOutQuint,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          animation2 = !animation2;
                          animation3 = !animation3;
                        });
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.cyan,
                        child: Align(
                          child: AnimatedAlign(
                            duration: Duration(milliseconds: 1200),
                            alignment: animation3
                                ? Alignment.center
                                : Alignment.bottomRight,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 1200),
                              opacity: animation3 ? 1 : 0.2,
                              curve: Curves.ease,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //! AnimatedCrossFade DONE G.DOC
                Text(
                  'AnimatedCrossFade',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      animation4 = !animation4;
                    });
                  },
                  child: AnimatedCrossFade(
                    firstChild: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    secondChild: Container(
                      width: 150,
                      height: 70,
                      color: Colors.green,
                      child: Center(
                        child: Text('Halo'),
                      ),
                    ),
                    firstCurve: Curves.ease,
                    secondCurve: Curves.ease,
                    crossFadeState: animation4
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 300),
                    //reserveDuration: durasi ketika kembali ke child awal (dari secondChild kembali ke first child, kalau gaditulis, maka secara default durasinya sama kaya 'duration:')
                    reverseDuration: Duration(milliseconds: 300),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'HeroAnimation',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  padding: EdgeInsets.all(20),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/cobaanimationnavigator',
                            arguments: '${index + 20}');
                      },
                      //! Hero DONE G.DOC
                      child: Hero(
                        tag: '${index + 20}',
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://picsum.photos/id/${index + 20}/200/300"),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
