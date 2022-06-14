import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CobaDateAppBar extends StatelessWidget {
  const CobaDateAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("Coba Date & AppBar"),
        title: Container(
          //secara default, title berada di tengah, kalau mau gaditengah bisa dimatikan di centerTitle:
          color: Colors.blueAccent,
          //width: 50,
          height: 60,
        ),
        titleSpacing: 10, //memberi margin di kiri dan kanan
        centerTitle: false,
        leading: Container(
          //di leading, width dan height ga berfungsi, kalau mau atur width bisa pake leadingwith:
          color: Colors.green,
          width:
              1, //kalau width dimatikan,maka lebar akan otomatis sepanjang ukuran space title
          height: 1,
        ),
        leadingWidth: 100,
        actions: [
          //di actions, width aja yang berfungsi, height ngga. di actions bisa pasang lebih dari 1 widget
          GestureDetector(
            onTap: () => print("actions 1"),
            child: Container(
              color: Colors.blue,
              width: 30,
              height: 1,
            ),
          ),
          GestureDetector(
            onTap: () => print("actions 2"),
            child: Container(
              color: Colors.red,
              width: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              print("actions 3");
            },
            icon: Icon(Icons.access_alarm_outlined),
            iconSize: 60,
          ),
        ],
        bottom: PreferredSize(
          child: Container(
            width: 60,
            height: 100,
            color: Colors.amber,
          ),
          preferredSize: Size.fromHeight(200),
        ),
        flexibleSpace: Container(
          color: Colors.brown,
          width: 1, //width ga berpengaruh ke apapun
          height: 120,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(
              DateTime(2021, 10, 24, 15, 15, 45, 55).toString(),
            ),
            Text(
              DateTime.now().toString(),
            ),
            Text(
              DateFormat.E().format(
                DateTime.now(),
              ),
            ),
            Text(
              DateFormat.MMMMEEEEd().format(
                DateTime.now(),
              ),
            ),
            Text(
              DateFormat.MMMEd().format(
                DateTime.now(),
              ),
            ),
            Text(
              DateFormat.s().format(
                DateTime.now(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
