import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coba Animation'),
      ),
      body: Container(
        //width: 100,
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      animation1 = !animation1;
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
                      color: Colors.amber,
                    ),
                    //secondChild: Center(child: Icon(Icons.replay)),
                    secondChild: Text('Halo'),
                    firstCurve: Curves.easeInOutBack,
                    secondCurve: Curves.easeInOutBack,
                    crossFadeState: animation4
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 1200),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
