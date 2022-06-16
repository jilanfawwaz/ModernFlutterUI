import 'dart:math';

import 'package:flutter/material.dart';

class CobaGridView extends StatelessWidget {
  const CobaGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _myGrid = List.generate(100, (index) {
      return Container(
        //untuk width dan height tidak akan berpengaruh di grid, karena grid menggunakan ratio, bukan fix height
        //width: 100,
        //height: 100,
        color: Color.fromARGB(
          255,
          Random().nextInt(256),
          Random().nextInt(256),
          Random().nextInt(256),
        ),
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Grid View"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.white,
            ),
            GridView.count(
              //kalau GridView aja gamake .count, masukkan semua (kecuali children) ke gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount, ....),
              
              //shrinkwrap berfungsi agar panjang grid hanya sesuai sama panjang list, tidak mengambil panjang sepanjang parentnya
              shrinkWrap: true,
              childAspectRatio: 4 / 3,

              //scrollDirection: Axis.horizontal,
              //physics: NeverScrollableScrollPhysics(),
              //physics: ClampingScrollPhysics(),
              physics: BouncingScrollPhysics(),

              padding: EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: _myGrid,
            ),
          ],
        ),
      ),

      //NOTE: yang ini container tetap stay diatas, grid view bisa discroll
      /*body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.white,
          ),
          Expanded(
            //or Flexible, or container kalau mau menambahkan fixed height
            child: GridView.count(
              //shrinkwrap berfungsi agar panjang grid hanya sesuai sama panjang list, tidak mengambil panjang sepanjang parentnya
              shrinkWrap: true,
              childAspectRatio: 4 / 3,
              //physics: NeverScrollableScrollPhysics(),
              //scrollDirection: Axis.horizontal,
              //physics: BouncingScrollPhysics(),

              //padding: EdgeInsets.all(5),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: _myGrid,
            ),
          ),
        ],
      ),*/
    );
  }
}
