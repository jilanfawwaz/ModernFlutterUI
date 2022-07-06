import 'dart:math';

import 'package:flutter/material.dart';

class CobaKey extends StatefulWidget {
  const CobaKey({Key? key}) : super(key: key);

  @override
  State<CobaKey> createState() => _CobaKeyState();
}

class _CobaKeyState extends State<CobaKey> {
  final List<Map<String, dynamic>> _dataList = [
    {'id': '1', 'name': "Jilan Fawwaz", 'pekerjaan': "programmer"},
    {'id': '2', 'name': "jidan 1", 'pekerjaan': "Bondeng Warior"},
    {'id': '3', 'name': "jidan 2", 'pekerjaan': "Bondeng Warior"},
    {'id': '4', 'name': "jidan 3", 'pekerjaan': "Bondeng Warior"},
    {'id': '5', 'name': "jidan 4", 'pekerjaan': "Bondeng Warior"},
  ];

  /*final List<Color> randomColor = [
    Colors.amber,
    Colors.green,
    Colors.blue,
    Colors.black,
    Colors.grey,
    Colors.cyan,
    Colors.brown,
    Colors.lime,
    Colors.purple
  ];

  List<Color> myColor = [];

  @override
  void initState() {
    super.initState();
    for (var _ in _dataList) {
      myColor.add(randomColor[Random().nextInt(randomColor.length)]);
    }
  }*/

  tapDelete(Map<String, dynamic> dataList) {
    setState(() {
      print("Masuk nih");
      _dataList.remove(dataList);

      print(_dataList);
    });
  }

  @override
  Widget build(BuildContext context) {
    //TIPS: Random Color

    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Key"),
      ),
      body: ListView.separated(
        //key: UniqueKey(),
        itemCount: _dataList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemBuilder: (context, index) {
          return ProjectItem(
            //key: ObjectKey(_dataList[index]),
            //key: UniqueKey(),
            key: ValueKey(_dataList[index]["id"]),
            nama: _dataList[index]["name"],
            job: _dataList[index]["pekerjaan"],
            onTap: () => tapDelete(_dataList[index]),
            /*onTap: () => setState(() {
              //print("Masuk nih");
              _dataList.remove(_dataList[index]);

              print(_dataList);
            }),*/
          );
        },
      ),

      /*body: ListView(
        children: [
          for (final expense in _dataList)
            ProjectItem(
              //key: ObjectKey(expense),

              key: ValueKey(expense["id"]),
              expense: expense,
              onTap: () => tapDelete(expense),
            ),
        ],
      ),*/
    );
  }
}

//TIPS:kalau mau membuat widget yang pake key, harus bikin class baru untuk widget tersebut
class ProjectItem extends StatefulWidget {
  const ProjectItem({
    Key? key,
    required this.nama,
    required this.job,
    required this.onTap,
  }) : super(key: key);

  final String nama;
  final String job;
  //NOTE:VoidCallBack
  final VoidCallback onTap;

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  final List<Color> randomColor = [
    Colors.amber,
    Colors.green,
    Colors.blue,
    Colors.black,
    Colors.grey,
    Colors.cyan,
    Colors.brown,
    Colors.lime,
    Colors.purple
  ];

  late Color myColor = randomColor[Random().nextInt(randomColor.length)];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print("Masukss");
      },
      //key: ValueKey(_dataList[index]['id']),
      leading: CircleAvatar(
        //TIPS: Kalau make key usahakan manggi ke variabel, jangan langsung ke random
        backgroundColor: myColor,
      ),
      title: Text(
        //TIPS: Manggil constructor dari class stateful widget harus make widget. di depannya
        widget.nama,
      ),
      subtitle: Text(widget.job),
      trailing: IconButton(
        onPressed: () {
          widget.onTap();
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}

/*class ProjectItem extends StatefulWidget {
  const ProjectItem({
    Key? key,
    //required this.nama,
    //required this.job,
    required this.expense,
    required this.onTap,
  }) : super(key: key);

  //final String nama;
  //final String job;
  //NOTE:VoidCallBack
  final VoidCallback onTap;
  final Map<String, dynamic> expense;

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  final List<Color> randomColor = [
    Colors.amber,
    Colors.green,
    Colors.blue,
    Colors.black,
    Colors.grey,
    Colors.cyan,
    Colors.brown,
    Colors.lime,
    Colors.purple
  ];

  late Color myColor = randomColor[Random().nextInt(randomColor.length)];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print("Masukss");
      },
      //key: ValueKey(_dataList[index]['id']),
      leading: CircleAvatar(
        //TIPS: Kalau make key usahakan manggi ke variabel, jangan langsung ke random
        backgroundColor: myColor,
      ),
      title: Text(
        //TIPS: Manggil constructor dari class stateful widget harus make widget. di depannya
        widget.expense["name"],
      ),
      subtitle: Text(widget.expense["pekerjaan"]),
      trailing: IconButton(
        onPressed: () {
          widget.onTap();
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}*/



























//YANG INI GAKEPAKE
class PhotoProfile extends StatefulWidget {
  PhotoProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<PhotoProfile> createState() => _PhotoProfileState();
}

class _PhotoProfileState extends State<PhotoProfile> {
  final List<Color> randomColor = [
    Colors.amber,
    Colors.green,
    Colors.blue,
    Colors.black,
    Colors.grey,
    Colors.cyan,
    Colors.brown,
    Colors.lime,
    Colors.purple
  ];

  late Color myColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myColor = randomColor[Random().nextInt(randomColor.length)];
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: myColor,
    );
  }
}

class ProjectTiles extends StatelessWidget {
  const ProjectTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
