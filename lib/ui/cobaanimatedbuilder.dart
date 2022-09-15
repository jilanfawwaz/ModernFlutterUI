import 'package:flutter/material.dart';

import 'package:modern_flutter_ui/ui/cobaanimatedbuildercontroller.dart';
import 'package:modern_flutter_ui/ui/cobaanimatedbuilderscale.dart';
import 'package:modern_flutter_ui/ui/cobaanimatedbuildertranslate.dart';
//! Done Screen G.Doc

//file ini cuma untuk menampilkan seluruh jenis2 animatedbuilder (scale, rotate, dll)

class CobaAnimatedBuilder extends StatelessWidget {
  const CobaAnimatedBuilder({Key? key}) : super(key: key);

//cobaanimatedbuilder.dart,
//cobaanimatedbuildercontroller.dart,
//cobaanimatedbuilderscale.dart,
//cobaanimatedbuilderscale.dart,
//cobaanimatedbuildertranslate.dart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coba Animated Builder'),
      ),
      body: Center(
        child: Column(
          children: [
            //! AnimatedBuilder DONE G.DOC
            CobaAnimatedBuilderController(),
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
