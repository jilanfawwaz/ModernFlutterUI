import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/ui/cobastateswitch.dart';

class CobaHalamanKosong extends StatelessWidget {
  const CobaHalamanKosong({Key? key}) : super(key: key);

  static String nameRoute = '/cobahalamankosong';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Kosong"),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, CobaState.nameRoute,
                arguments: ModalRoute.of(context)?.settings.arguments as int);
          },
          child: Text("Kembali"),
        ),
      ),
    );
  }
}
