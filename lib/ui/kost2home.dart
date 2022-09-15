import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/kost2provider.dart';
import 'package:modern_flutter_ui/models/kost2model.dart';
import 'package:modern_flutter_ui/shared/theme.dart';

import 'package:modern_flutter_ui/widget/kost2widgetcardpertama.dart';
import 'package:provider/provider.dart';

import '../widget/kost2homebottomnav.dart';
import '../widget/kost2homecontent.dart';
//! Done Screen G.Doc

class KostHome extends StatelessWidget {
  const KostHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: EdgeInsets.only(left: 24, top: 24, bottom: 30, right: 24),
        child: Stack(
          children: [
            KostHomeContent(),
            KostHomeBottomNav(),
          ],
        ),
      ),
    );
  }
}
