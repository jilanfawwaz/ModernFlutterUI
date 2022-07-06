import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/ui/cobakeykuldiiadddata.dart';
import 'package:modern_flutter_ui/widget/cobakeykuldiiwidget.dart';

class CobaKeyKuldiiHome extends StatelessWidget {
  const CobaKeyKuldiiHome({Key? key}) : super(key: key);

  static const nameRoute = '/cobakeykuldiihome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Key from Kuldii"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CobaKeyKuldiiAddData.nameRoute);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return CobaKeyKuldiiWidget(
            title: "Test",
            subtitle: "Sub Test",
            date: DateTime.now(),
          );
        },
      ),
    );
  }
}
