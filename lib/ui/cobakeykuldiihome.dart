import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/cobakeykuldiprovider.dart';
import 'package:modern_flutter_ui/ui/cobakeykuldiiadddata.dart';
import 'package:modern_flutter_ui/widget/cobakeykuldiiwidget.dart';
import 'package:provider/provider.dart';

class CobaKeyKuldiiHome extends StatelessWidget {
  const CobaKeyKuldiiHome({Key? key}) : super(key: key);

  static const nameRoute = '/cobakeykuldiihome';

  @override
  Widget build(BuildContext context) {
    final cobaKeyProvider =
        Provider.of<CobaKeyKuldiiProvider>(context, listen: false);
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
      body: Consumer<CobaKeyKuldiiProvider>(
        builder: (context, itemcobaKeyProvider, child) {
          /*return ListView.builder(
            itemCount: cobaKeyProvider.data.length,
            itemBuilder: (BuildContext context, int index) {
              return CobaKeyKuldiiWidget(
                //key: ObjectKey(cobaKeyProvider.data[index]),
                id: cobaKeyProvider.data[index].id,
                title: cobaKeyProvider.data[index].title,
                subtitle: cobaKeyProvider.data[index].subtitle,
                date: cobaKeyProvider.data[index].date,
              );
            },
          );*/
          return ListView(
            children: [
              for (final item in cobaKeyProvider.data)
                CobaKeyKuldiiWidget(
                  //key: ObjectKey(cobaKeyProvider.data[index]),
                  key: Key(item.id),
                  //key: ValueKey(item.id),
                  id: item.id,
                  title: item.title,
                  subtitle: item.subtitle,
                  date: item.date,
                ),
            ],
          );
        },
      ),
    );
  }
}
