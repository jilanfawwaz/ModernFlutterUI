import 'package:flutter/material.dart';

import 'package:modern_flutter_ui/ui/cobaanimatedbuildercontroller.dart';
import 'package:modern_flutter_ui/ui/cobaanimatedbuilderscale.dart';
import 'package:modern_flutter_ui/ui/cobaanimatedbuildertranslate.dart';

class CobaAnimatedBuilder extends StatelessWidget {
  const CobaAnimatedBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coba Animated Builder'),
      ),
      body: Center(
        //child: CobaAnimatedBuilderController(),
        child: Column(
          children: [
            //CobaAnimatedBuilderController(),
            const SizedBox(
              height: 50,
            ),
            //CobaAnimatedBuilderScale(),
            const SizedBox(
              height: 50,
            ),
            //CobaAnimatedBuilderTranslate()
          ],
        ),
      ),
    );
  }
}
